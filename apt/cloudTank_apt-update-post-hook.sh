#!/bin/bash

# Since most modern Debian based distros use PackageKit, we have to silence the script if called by PackageKits apt backend.
# When it is called by apt update the manual way, we can use colored, interactive output.
# https://www.freedesktop.org/software/PackageKit/pk-faq.html#user-interaction


h1="\033[0;1;4;93m"
h2="\033[0;1;93m"
text="\033[0;33m"
end="\033[0m"


function cloudTank-updater {
	
	# https://scripter.co/nim-check-if-stdin-stdout-are-associated-with-terminal-or-pipe/
	
	if [ -t 0 ]; then # Script is called normally - Terminal input (keyboard) - interactive
        	echo
        	echo
        	echo -e "${h1}cloudTank >>  updating proton${end}"
		echo
		echo -e "${h2}Installed versions:${text}"
        	sudo -u USER USERSHOME/.local/bin/protonup -l
		echo
		echo -e "${h2}Updating:${text}"
        	sudo -u USER USERSHOME/.local/bin/protonup
        	echo
		echo -e $end
        	echo
        else # Script is getting input from pipe or file - non-interactive
        	sudo -u USER USERSHOME/.local/bin/protonup -y
        fi
}

cloudTank-updater
