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


# setup additional sources
bash setup_additional_sources.sh

# install needed dependencies [30.01.2022 @5.16.4]
sudo apt install -y libssl3

# install latest mainline kernel
sudo mainline --install-latest --yes
