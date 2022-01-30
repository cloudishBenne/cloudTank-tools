#!/bin/bash


# only install oibaf graphics if AMD GPU is detected
if [[ "$(sudo lshw -C display | grep --quiet AMD/ATI && echo 1 || echo 0)" = 1 ]]; then
    
    # setup edge graphicstack from oibaf
    
    # remove this file because otherwise the ppa-disable process by pop-os for distro upgrading doesn’t work properly
    # TODO: remove this line on 02.2023
    sudo rm /etc/update-manager/release-upgrades.d/pop-oibaf-graphics.cfg

    # Pinning the repo over pop_os own packages
    sudo cp pop-oibaf-graphics /etc/apt/preferences.d/pop-oibaf-graphics
    
    # Adding the PPA
    sudo add-apt-repository -y ppa:oibaf/graphics-drivers
    sudo apt-get update && \
    sudo apt upgrade -y --fix-broken --fix-missing --install-recommends
else

    echo Oibaf edge graphics are not needed, you don’t have an AMD GPU
fi


# setup additional sources from ubuntu jammy repo
# [30.01.2022] this is needed to install 5.16 kernel from mainline, linux-headers-5.16.4-051604-generic depends on it

# Pinning the repo under all other packages to avoid auto updating
sudo cp ubuntu-jammy-patch /etc/apt/preferences.d/ubuntu-jammy-patch

# Adding the sources
sudo cp ubuntu-jammy-patch.sources /etc/apt/sources.list.d/ubuntu-jammy-patch.sources



# setup ubuntu mainline

# add ppa
sudo add-apt-repository -y ppa:cappelikan/ppa
sudo apt update && \
sudo apt install -y mainline
