#!/bin/bash

# Keep repo on update enabled
sudo cp pop-oibaf-graphics.cfg /etc/update-manager/release-upgrades.d/pop-oibaf-graphics.cfg

# Pinning the repo over pop_os own packages
sudo cp pop-oibaf-graphics /etc/apt/preferences.d/pop-oibaf-graphics


# Adding the PPA
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt-get update && sudo apt upgrade -y --fix-broken --fix-missing --install-recommends
