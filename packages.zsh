#! /usr/bin/zsh
set -Eeuxo pipefail

echo "[+] Starting packages setup..." 

# Set the clock and timezone
echo "[ ] Setting timezone and clock"
ln -sf /usr/share/zoneinfo/Europe/Bratislava /etc/localtime
hwclock --systohc

# Set locales
echo "[ ] Generating locales"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen

# This is a just a placeholder with basics for now
echo "[ ] Installing packages"
pacman -Syy
pacman -S --noconfirm \
    acpi \
    acpi_call \
    acpid \
    bluez \
    bluez-utils \
    base-devel \
    btop \
    iwd \
    git \
    inetutils \
    dosfstools \
    intel-gpu-tools \
    intel-media-driver \
    openssh \
    snapper \
    power-profiles-daemon \
    zram-generator \
    zip 
