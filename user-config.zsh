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
  system76-firmware-daemon \
  man-db \
  grc \
  ncmpcpp \
  less \
  jq \
  yubikey-manager \
  libfido2 \
  keychain \
  mc \
  nmap \
  firefox \
  betterbird-bin \
  1password \
  gvfs \
  gvfs-smb \
  unzip


echo "[ ] Changing shell to zsh"
# Set shell to zsh
chsh -s /bin/zsh

echo "[ ] Creating HOME subdirectories"
# Create ~/volumes directories
mkdir -p /home/${MY_USER}/volumes/{usb1,usb2,backups}
mkdir -p ~/.config

# zsh goodies
yay -Sy ttf-meslo-nerd-font-powerlevel10k oh-my-zsh-git zsh-theme-powerlevel10k zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete
sudo ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/custom/plugins
sudo ln -s /usr/share/zsh/plugins/zsh-autocomplete /usr/share/oh-my-zsh/custom/plugins
sudo ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins

# Audio / mpd / ncmpcpp
sudo systemctl disable --now mpd
mkdir -p /home/${MY_USER}/.mpd/playlists
touch /home/${MY_USER}/{state,database,sticker.sql}
mkdir -p /home/${MY_USER}/.ncmpcpp/lyrics
mkfifo /tmp/mpd.fifo
sudo systemctl --user enable --now mpd

# TODO: Set dotfiles

