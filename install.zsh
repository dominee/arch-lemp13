#! /usr/bin/zsh 
set -Eeuxo pipefail

#
# Version 0.1
# Based on https://github.com/hmuendel/arch-install/blob/master/install.zsh
#

if [[ -z "${CRYPT_PW}" ]]; then
    echo "CRYPT_PW must be set"
    exit
fi

# My default values for this host
MY_USER="dominee"
MY_ROOT="/dev/nvme0n1p3"

# To have a font that is more readable
setfont latarcyrheb-sun32

# Mandatory welcome
echo "[+] It has begun!"

# Time sync just in case
echo "[ ] Enabling ntp"
timedatectl set-ntp true

echo "[ ] Creating partition layout"
# Zapping the old partition table and creating a new one and the partition
# Use this if you want a clean install
# sgdisk -Z /dev/nvme0n1
# sgdisk -a1 -n1:2048:1128447 -t1:EF00 -N2  /dev/nvme0n1

# version for keeping Original EFI and Pop!_OS /recovery partition
sgdisk -d 4 /dev/nvme0n1 # Delete Old Swap
sgdisk -d 3 /dev/nvme0n1 # Delete Old LVM root
sgdisk -a1 -N3 /dev/nvme0n1 # New part for crypt root filling the freed space
sgdisk -p /dev/nvme0n1

# If you do not keep /restore crypt root will be on /dev/nvme0n1p2
echo "[ ] LUKS cryptsetup"
echo -n "${CRYPT_PW}" | cryptsetup -q luksFormat ${MY_ROOT} -
echo -n "${CRYPT_PW}" | cryptsetup open ${MY_ROOT} cryptroot -d -

# Create filesystems (wipe EFI)
echo "[ ] Making filesystems"
mkfs.vfat -F32 -n EFI /dev/nvme0n1p1 
mkfs.btrfs -f -L ROOT /dev/mapper/cryptroot
lsblk

echo "Mount root"
mount /dev/mapper/cryptroot /mnt
cd /mnt

# Change BTRFS root volume and create subgroups
echo "[ ] BTRFS setup"
btrfs subvolume create @
mkdir @/0
btrfs subvolume create @/0/snapshot

for i in {home,root,srv,usr,usr/local,var};
    do btrfs subvolume create @$i;
done

for i in {tmp,spool,log};
    do btrfs subvolume create @var/$i;
done

mkdir -p @var/lib/docker
btrfs sub create @var/lib/docker/btrfs

cd ~
umount /mnt

# Create directory structure for subvolume mounts
echo "[ ] Creating mountpoints"
mount -o noatime,nodiratime,compress=zstd,space_cache=v2,discard=async,autodefrag,subvol=@/0/snapshot /dev/mapper/cryptroot /mnt
mkdir -p /mnt/{.snapshots,home,root,srv,tmp,usr/local}
mkdir -p /mnt/var/{tmp,spool,log,lib/docker/btrfs}
mount -o noatime,nodiratime,compress=zstd,space_cache=v2,discard=async,autodefrag,subvol=@ /dev/mapper/cryptroot /mnt/.snapshots/ 

# Mount all subvolumes
echo "[ ] Mounting subvolumes and EFI"
for i in {home,root,srv,usr/local};
    do mount -o subvol=@$i,noatime,nodiratime,compress=zstd,space_cache=v2,discard=async,autodefrag /dev/mapper/cryptroot /mnt/$i
done

 for i in {tmp,spool,log,lib/docker/btrfs};
    do mount -o subvol=@var/$i,noatime,nodiratime,compress=zstd,space_cache=v2,discard=async,autodefrag /dev/mapper/cryptroot /mnt/var/$i 
done

# Mount the EFI partition
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot

# Update and base install
echo "[+] Installing..."
pacman -Syy
pacstrap /mnt linux linux-headers linux-lts linux-lts-headers linux-firmware base neovim intel-ucode btrfs-progs efibootmgr zsh

# Generate `/etc/fstab`:
echo "[ ] Generating /etc/fstab"
genfstab -U /mnt >> /mnt/etc/fstab

# Remove hard-coded system subvolume. If not removed, system will ignore btrfs 
# default-id setting, which is used by snapper when rolling back:

sed -i 's|,subvolid=[0-9]*,subvol=/@/0/snapshot||' /mnt/etc/fstab

# updating repositories
echo "[ ] Fetching postinstall scripts"
curl https://raw.githubusercontent.com/dominee/arch-lemp13/master/boot-config.zsh -o /mnt/root/boot-config.zsh
chmod +x /mnt/root/boot-config.zsh

curl https://raw.githubusercontent.com/dominee/arch-lemp13/master/packages.zsh -o /mnt/root/packages.zsh
chmod +x /mnt/root/packages.zsh

curl https://raw.githubusercontent.com/dominee/arch-lemp13/master/config.zsh -o /mnt/root/config.zsh
chmod +x /mnt/root/config.zsh

# `chroot` into the new system:
echo "[+] Executing BOOT-CONFIG script..."
arch-chroot /mnt/ /root/boot-config.zsh
echo "[+] Executing PACKAGES script..."
arch-chroot /mnt/ /root/packages.zsh
echo "[+] Executing CONFIG script..."
arch-chroot /mnt/ /root/config.zsh

echo "[+] Preparing user config script"
curl https://raw.githubusercontent.com/dominee/arch-lemp13/master/user-config.zsh -o "/mnt/home/${MY_USER}/user-config.zsh"
chmod +x "/mnt/home/${MY_USER}/user-config.zsh"
chown "${MY_USER}:${MY_USER}" "/mnt/home/${MY_USER}/user-config.zsh"

echo "[+] Finish him!"