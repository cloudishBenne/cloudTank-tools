#!/bin/bash

if [[ "$EUID" = 0 ]]; then
    echo "> already root"
else
    sudo -k # make sure to ask for password on next sudo
    if sudo true; then
        echo "> correct password"
    else
        echo "> wrong password"
        exit 1
    fi
fi
# Do your sudo stuff here. Password will not be asked again due to caching.


# Minecraft
echo "> installing java ..."
sudo apt-get -y install default-jre \
        openjdk-8-jre \
        openjdk-11-jre \
        openjdk-17-jre \
	>/dev/null 2>&1
echo "  ... done"
echo ""

echo "> downloading minecraft launcher"
echo ""
curl 'https://launcher.mojang.com/download/Minecraft.deb' \
	--compressed --output $HOME/Downloads/Minecraft.deb

echo "> installing minecraft ..."
sudo dpkg -i /tmp/Minecraft.deb >/dev/null 2>&1
rm $HOME/Downloads/Minecraft.deb
minecraft-launcher >/dev/null 2>&1
echo "  ... done"


# Minecraft Starterdatei
echo '[Desktop Entry]
Type=Application
Version=1.1
Name=cloudTank Launcher
Comment=cloudTanks Minecraft Launcher
Exec=gamemoderun mangohud --dlsym minecraft-launcher
Icon=minecraft-launcher
Terminal=false
Categories=Game;Application;
StartupWMClass=minecraft-launch' > $HOME/.local/share/applications/minecraft-cloudtank.desktop

# Minecraft cloudTank
cd $HOME/codes/cloudTank/cloudTank-tools
chmod +x updateclient.sh
echo "> installing cloudTank launcher"
sudo apt-get -y install gamemode mangohud
./updateclient.sh
