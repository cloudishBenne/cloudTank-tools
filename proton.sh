#!/bin/bash


DIR_CLOUDTANK=$HOME/codes/cloudTank
DIR_PROTONUP=$DIR_CLOUDTANK/protonup
DIR_STEAM_COMPAT=$HOME/.steam/root/compatibilitytools.d/

if [ -d $DIR_PROTONUP ]; then
	cd $DIR_PROTONUP && \
		git pull && \
		python3 setup.py install --user && \
                source ~/.profile && \
                protonup -d "$DIR_STEAM_COMPAT"
else
	sudo apt install python3-setuptools 
	
	cd $DIR_CLOUDTANK && \
		git clone https://github.com/AUNaseef/protonup && \
		cd protonup && \
			git config pull.rebase true && \
			python3 setup.py install --user && \
			source ~/.profile && \
			protonup -d "$DIR_STEAM_COMPAT"
			
	cp $DIR_CLOUDTANK/cloudTank-tools/apt/80cloudTank $DIR_CLOUDTANK/cloudTank-tools/apt/80tmp
	sed -i "s|USERSHOME|$HOME|g" $DIR_CLOUDTANK/cloudTank-tools/apt/80tmp
	sudo cp $DIR_CLOUDTANK/cloudTank-tools/apt/80tmp /etc/apt/apt.conf.d/80cloudTank
	rm  $DIR_CLOUDTANK/cloudTank-tools/apt/80tmp
	
	cp $DIR_CLOUDTANK/cloudTank-tools/apt/cloudTank_apt-update-post-hook.sh $HOME/.local/bin/cloudTank_apt-update-post-hook.sh
	sed -i "s|USERSHOME|$HOME|g" $HOME/.local/bin/cloudTank_apt-update-post-hook.sh
	sed -i "s|USER|$(whoami)|g" $HOME/.local/bin/cloudTank_apt-update-post-hook.sh
	
	cp $DIR_CLOUDTANK/cloudTank-tools/apt/cloudTank_apt-upgrade-post-hook.sh $HOME/.local/bin/cloudTank_apt-upgrade-post-hook.sh
	sed -i "s|USERSHOME|$HOME|g" $HOME/.local/bin/cloudTank_apt-upgrade-post-hook.sh
	sed -i "s|USER|$(whoami)|g" $HOME/.local/bin/cloudTank_apt-upgrade-post-hook.sh
fi

