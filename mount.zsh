#! /usr/bin/zsh
#
# Helper script for troubleshooting from installer
#

MY_ROOT="/dev/nvme0n1p3"

cryptsetup luksOpen ${MY_ROOT} cryptroot

# Mount root
mkdir /mnt/.snapshots
mount -o noatime,nodiratime,compress=zstd,space_cache=v2,discard=async,autodefrag,subvol=@/0/snapshot /dev/mapper/cryptroot /mnt
mount -o noatime,nodiratime,compress=zstd,space_cache=v2,discard=async,autodefrag,subvol=@ /dev/mapper/cryptroot /mnt/.snapshots/

# Mount all subvolumes
for i in {home,root,srv,usr/local};
    do
        mkdir -p /mnt/$i
        mount -o subvol=@$i,noatime,nodiratime,compress=zstd,space_cache=v2,discard=async,autodefrag /dev/mapper/cryptroot /mnt/$i
done

 for i in {tmp,spool,log,lib/docker/btrfs};
    do
        mkdir -p /mnt/var/$i
        mount -o subvol=@var/$i,noatime,nodiratime,compress=zstd,space_cache=v2,discard=async,autodefrag /dev/mapper/cryptroot /mnt/var/$i
done

# Mount the EFI partition
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
