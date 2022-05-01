#!/bin/bash


sudo rsync -a /etc/apt/ /home/${USER}/apt-bak
apt list --manual-installed | sudo tee /home/${USER}/apt-bak/manually-installed.txt

sudo rm /etc/apt/preferences.d/ubuntu-jammy-patch
sudo rm /etc/apt/sources.list.d/ubuntu-jammy-patch.sources

flatpak list --system | tee /home/${USER}/flatpak-sys-bak.txt
flatpak install --user flathub org.gnome.DejaDup

flatpak run org.gnome.DejaDup

sudo apt update && sudo apt full-upgrade -y
read -n 1 -p "Upgrade to Pop!_OS 22.04 now? [y|N]: " upgrade && printf '\n'
[ "$upgrade" == "y" ] && pop-upgrade release upgrade

