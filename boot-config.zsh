#! /usr/bin/zsh
set -Eeuxo pipefail

# My defaults
MY_ROOT="/dev/nvme0n1p3"

echo "[+] Boot config starting..."

# Configure the creation of 
# [initramfs](https://wiki.archlinux.org/index.php/Arch_boot_process#initramfs) 
# by editing `/etc/mkinitcpio.conf`. Change the line `HOOKS=...` to:
#
sed -i 's/HOOKS=(.*)/HOOKS=(base keyboard udev autodetect modconf block encrypt btrfs filesystems fsck)/' /etc/mkinitcpio.conf 

echo "[ ] Generating kernel ramdisks"
mkinitcpio -p linux
mkinitcpio -p linux-lts

bootctl --path=/boot install

# The UUID of the root partition can be determined via `blkid`. Create file 
# `/boot/loader/entries/arch.conf` containing the uuid like so: 
cat > /boot/loader/entries/arch.conf << EOF
title Arch Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options cryptdevice=UUID=$(blkid -s UUID -o value /dev/nvme0n1p3):cryptoroot:allow-discards root=/dev/mapper/cryptoroot rootflags=subvol=@/0/snapshot rd.luks.options=discard rw
EOF

cat > /boot/loader/entries/arch-lts.conf << EOF
title Arch Linux (lts)
linux /vmlinuz-linux-lts
initrd /intel-ucode.img
initrd /initramfs-linux-lts.img
options cryptdevice=UUID=$(blkid -s UUID -o value /dev/nvme0n1p3):cryptoroot:allow-discards root=/dev/mapper/cryptoroot rootflags=subvol=@/0/snapshot rd.luks.options=discard rw
EOF

cat > /boot/loader/loader.conf << EOF
default  arch.conf
timeout  4
console-mode max
editor   no
EOF