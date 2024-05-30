#! /usr/bin/zsh
set -Eeuxo pipefail
export MY_HOSTNAME="gh0st"
export MY_USER="dominee"

# Set hostname
echo "[ ] Setting hostname"
echo "${MY_HOSTNAME}" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 ${MY_HOSTNAME}.local ${MY_HOSTNAME}" >> /etc/hosts
passwd

echo "[ ] Configuring zRAM"
cat << EOF > /etc/systemd/zram-generator.conf
[zram0]
compression-algorithm = zstd
zram-size = ram / 4
swap-priority = 100
EOF

systemctl daemon-reload
systemctl start systemd-zram-setup@zram0


echo "[ ] Enabling system services"
# enable systemd services
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable iwd
systemctl enable bluetooth
systemctl enable power-profiles-daemon
# enable if you want to use weekly trims
systemctl enable fstrim.timer
systemctl enable acpid


echo "[ ] Pacman configuration"
# pacman configuration
sed -i 's/\[options\]/[options]\nColor\nILoveCandy\nVerbosePkgLists/' /etc/pacman.conf

echo "[ ] Network configuration"
# # network configuration
# cat << EOF > /etc/systemd/network/20-ethernet.network
# [Match]
# Name=enp*

# [Network]
# DHCP=true
# EOF

cat << EOF > /etc/systemd/network/25-wireless.network
[Match]
Name=wlan0

[Network]
DHCP=true
EOF

echo "[ ] Snapper configuration"
# snapper btrfs snapshot config (see https://wiki.archlinux.org/title/Snapper#Configuration_of_snapper_and_mount_point)
#
umount /.snapshots || true
rm -r /.snapshots || true
snapper --no-dbus -c root create-config /
btrfs subvolume delete /.snapshots
mkdir /.snapshots
mount -a
chmod 750 /.snapshots

echo "[ ] Creating user: ${MY_USER}"
# create user
useradd -m "${MY_USER}"
passwd "${MY_USER}"
groupadd plugdev
usermod -aG audio,plugdev,storage,tty,uucp,wheel "${MY_USER}"

echo "[ ] Configuring sudo"
echo "${MY_USER} ALL=(ALL) ALL" >> /etc/sudoers.d/"${MY_USER}"
# move things to main user
#rm -rf "/home/${MY_USER}/.ssh" && mv "/root/.ssh /home/${MY_USER}/" && chown -R "${MY_USER}:${MY_USER}" "/home/${MY_USER}/.ssh"

echo "[ ] Configuring resolver"
# Link resolv.conf (needed for importing keys with gpg)
rm /etc/resolv.conf
ln -s /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf


