#!/usr/bin/env bash


h1="\033[0;1;4;93m"
h2="\033[0;1;93m"
text="\033[0;33m"
end="\033[0m"

function download () {
	DOWNLOAD+=-O" "$1" "
}

function cursed_curl () {

	curl --parallel --compressed $DOWNLOAD
}


echo
echo -e "${h1}cloudTank >>  Updating minecraft${end}"
echo
echo
echo -e "${h2}Cleaning up mods folder ...${end}"
echo
mkdir -p $HOME/.minecraft/mods
cd $HOME/.minecraft/mods
rm -r *
echo -e "${text}    ... done${end}"
echo


DOWNLOAD=""

echo
echo -e "${h2}Downloading new mods ...${text}"
echo
download "https://media.forgecdn.net/files/3407/19/cofh_core-1.16.5-1.3.1.jar"
download "https://media.forgecdn.net/files/3412/300/thermal_foundation-1.16.5-1.3.2.jar"
download "https://media.forgecdn.net/files/3404/884/thermal_expansion-1.16.5-1.3.0.jar"
download "https://media.forgecdn.net/files/3404/886/thermal_innovation-1.16.5-1.3.0.jar"
download "https://media.forgecdn.net/files/3404/883/thermal_cultivation-1.16.5-1.3.0.jar"
download "https://media.forgecdn.net/files/3404/887/thermal_locomotion-1.16.5-1.3.0.jar"
download "https://media.forgecdn.net/files/3407/20/archers_paradox-1.16.5-1.3.1.jar"
download "https://media.forgecdn.net/files/3407/21/ensorcellation-1.16.5-1.3.1.jar"
download "https://media.forgecdn.net/files/3374/63/Patchouli-1.16.4-53.1.jar"
download "https://media.forgecdn.net/files/3319/255/theoneprobe-1.16-3.1.4.jar"
download "https://media.forgecdn.net/files/3400/575/refinedstorage-1.9.15.jar"
download "https://media.forgecdn.net/files/3400/591/refinedstorageaddons-0.7.3.jar"
download "https://media.forgecdn.net/files/3113/506/refinedpipes-0.5.jar"
download "https://media.forgecdn.net/files/3065/697/rangedpumps-0.8.2.jar"
download "https://media.forgecdn.net/files/3360/574/BiomesOPlenty-1.16.5-13.1.0.477-universal.jar"
download "https://media.forgecdn.net/files/3442/610/minecolonies-0.14.353-BETA-universal.jar"
download "https://media.forgecdn.net/files/3434/503/structurize-0.13.210-ALPHA-universal.jar"
download "https://media.forgecdn.net/files/3438/494/jei-1.16.5-7.7.1.121.jar"
cursed_curl
echo -e $end

echo
echo -e "${h2}Downloading Optifine ...${text}"
echo
curl -o optifine.jar https://optifine.net/$(curl --silent https://optifine.net/adloadx?f=OptiFine_1.16.5_HD_U_G8.jar | grep .jar | grep '>Download<' | cut -d"'" -f2)
echo -e $end

echo
echo -e "${h2}Downloading Forge ...${text}"
echo
cd $HOME/.minecraft
rm forge*.jar
curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.16.5-36.1.0/forge-1.16.5-36.1.0-installer.jar

echo
echo -e "${h2}Updating Forge ...${text}"
echo
java -jar forge-1.16.5-36.1.0-installer.jar > /dev/null
echo -e $end

echo
echo -e "${h1}You can start gaming now, enjoy!${end}"
