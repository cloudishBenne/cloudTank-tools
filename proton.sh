#!/bin/bash

cd $HOME/codes/cloudtank/cloudTank-tools

git clone https://github.com/AUNaseef/protonup && cd protonup
python3 setup.py install --user

protonup -d "~/.steam/root/compatibilitytools.d/"

protonup
