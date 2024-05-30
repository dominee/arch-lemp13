#! /usr/bin/zsh
set -Eeuxo pipefail

export MY_HOSTNAME="gh0st"
export MY_USER="dominee"

# Run this as the main user of the system
echo "[+] Starting user configuration"

echo "[ ] Installing YAY"
# AUR Packages
# Install yay
mkdir -p ~/downloads && cd ~/downloads
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd .. && rm -rf yay-bin

echo "[ ] Installing AUR packages"
# Install AUR packages
yay -S --noconfirm \
  nerd-fonts-noto \
  system76-firmware \
  system76-firmware-daemon


echo "[ ] Changing shell to zsh"
# Set shell to zsh
chsh -s /bin/zsh

echo "[ ] Creating HOME subdirectories"
# Create ~/volumes directories
mkdir -p /home/${MY_USER}/volumes/{usb1,usb2,backups}
mkdir -p ~/.config

# TODO: Set dotfiles

