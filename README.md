# arch-lemp13

My Arch linux setup on [System76 Lemur Pro](https://system76.com/laptops/lemur) (lemp13).

The goal is to have FDE via LUKS, Secureboot, BTRFS with snapshots, EFI via systemd-boot, zram, Wayland with Sway and Waybar.

## Basic installation

> If you are replacing Pop!_OS on the NVMe that came with your laptop, it is recommended to leave the recovery partition intact. The BIOS is hard-coded to attempt to boot this on `Space`, and this recovery partition can be a handy way to get out of a tight spot if something should happen that renders your Arch install unbootable.

Source: [ArchWiki:System76_Pangolin](https://wiki.archlinux.org/title/System76_Pangolin_pang12#Recovery_partition)

This should correspond to `/dev/nvme0n1p2` (a 4G partiton for `/recovery`) on the devault Pop!_OS install.

The default instalation disk layout is as following:

```console
zram0           251:0    0    16G  0 disk  [SWAP]
nvme0n1         259:0    0 931.5G  0 disk  
├─nvme0n1p1     259:1    0   512M  0 part  /boot/efi
├─nvme0n1p2     259:2    0     4G  0 part  /recovery
├─nvme0n1p3     259:3    0   923G  0 part  
│ └─cryptdata   252:0    0   923G  0 crypt 
│   └─data-root 252:1    0   923G  0 lvm   /
└─nvme0n1p4     259:4    0     4G  0 part  
  └─cryptswap   252:2    0     4G  0 crypt [SWAP]
```


Create a bootable media from the latest Arch [iso](https://archlinux.org/download/) or just copy it to the [Ventoy](https://www.ventoy.net/en/doc_start.html) flash drive.

Connect to WiFi.

```zsh
iwctl --passphrase <passphrase> station wlan0 connect <SSID>
ip addr show
```

Execute the installer script (YOLO version):

```zsh
export CRYPT_PW="PASSPHRASEGOESHERE"
curl https://raw.githubusercontent.com/dominee/arch-lemp13/main/install.zsh | zsh | tee install.log
```

## System76 Specifics

There is no guide for Lemur Pro in the [ArchWiki:Laptops](https://wiki.archlinux.org/title/Category:System76) section yet, so probably refer to [Oryx Pro](https://wiki.archlinux.org/title/System76_Oryx_Pro) guide.

Minimal required packaged:

* `system76-firmware` - required if you want to update your BIOS using `system76-firmware-cli schedule`
* `system76-firmware-daemon` and enable it `systemctl start system76-firmware-daemon`
* `firmware-manager` (AUR) - required if you want to know when there is a BIOS update available using `firmware-manager` GUI as root.

## References

* [Arch Linux Official Installation Guide](https://wiki.archlinux.org/title/Installation_guide)
* [How to Install Arch Linux: A Comprehensive Step-by-Step Guide](https://www.learnlinux.tv/how-to-install-arch-linux-a-comprehensive-step-by-step-guide/)
* [Hyprland](https://wiki.archcraft.io/docs/wayland-compositors/hyprland/) on Archcraft
* [JaKooLit's Arch Hyprland Install Script](https://github.com/JaKooLit/Arch-Hyprland)
* [Learn Linux... Install Arch with Full Disk Encryption.](https://fernandocejas.com/blog/engineering/2020-12-28-install-arch-linux-full-disk-encryption/#default-shell) including PowerLevel10k theme for `zsh`.
* [Arch Install LUKS, BTRFS, systemd-boot on a sytem76 lemur pro](https://github.com/hmuendel/arch-install)