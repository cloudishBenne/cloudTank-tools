#!/bin/bash

sudo apt install python3-setuptools 

cd $HOME/codes/cloudTank && \
	git clone https://github.com/AUNaseef/protonup && \
	cd protonup && \
		python3 setup.py install --user && \
source ~/.profile && \
protonup -d "~/.steam/root/compatibilitytools.d/" && \
protonup
