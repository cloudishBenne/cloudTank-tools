#!/usr/bin/env bash

echo "Cleaning up mods folder ..."
mkdir -p $HOME/.minecraft/mods
cd $HOME/.minecraft/mods
rm -rf *
echo "... done"

function cursed_curl () {
	curl $1 -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:87.0) Gecko/20100101 Firefox/87.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-GPC: 1' -H 'TE: Trailers' --output $2
}

echo "\n Downloading new mods ..."
cursed_curl "https://media.forgecdn.net/files/3249/453/cofh_core-1.16.4-1.2.1.jar" "cofh_core.jar"
cursed_curl "https://media.forgecdn.net/files/3248/150/thermal_foundation-1.16.4-1.2.0.jar" "thermal_foundation.jar"
cursed_curl "https://media.forgecdn.net/files/3247/0/thermal_expansion-1.16.4-1.2.0.jar" "thermal_expansion.jar"
cursed_curl "https://media.forgecdn.net/files/3247/2/thermal_innovation-1.16.4-1.2.0.jar" "thermal_innovation.jar"
cursed_curl "https://media.forgecdn.net/files/3246/999/thermal_cultivation-1.16.4-1.2.0.jar" "thermal_cultivation.jar"
cursed_curl "https://media.forgecdn.net/files/3247/3/thermal_locomotion-1.16.4-1.2.0.jar" "thermal_locomotion.jar"
cursed_curl "https://media.forgecdn.net/files/3246/995/archers_paradox-1.16.4-1.2.0.jar" "archers_paradox.jar"
cursed_curl "https://media.forgecdn.net/files/3246/996/ensorcellation-1.16.4-1.2.0.jar" "ensorcellation.jar"
cursed_curl "https://media.forgecdn.net/files/3204/37/Patchouli-1.16.4-50.jar" "Patchouli.jar"
cursed_curl "https://media.forgecdn.net/files/3157/997/theoneprobe-1.16-3.0.7.jar" "theoneprobe.jar"
cursed_curl "https://media.forgecdn.net/files/3196/167/refinedstorage-1.9.12.jar" "refinedstorage.jar"
cursed_curl "https://media.forgecdn.net/files/3065/694/refinedstorageaddons-0.7.2.jar" "refinedstorageaddons.jar"
cursed_curl "https://media.forgecdn.net/files/3113/506/refinedpipes-0.5.jar" "refinedpipes.jar"
cursed_curl "https://media.forgecdn.net/files/3065/697/rangedpumps-0.8.2.jar" "rangedpumps.jar"
cursed_curl "https://media.forgecdn.net/files/3236/10/BiomesOPlenty-1.16.4-13.0.0.432-universal.jar" "BiomesOPlenty.jar"
cursed_curl "https://media.forgecdn.net/files/3288/486/minecolonies-0.14.118-BETA-universal.jar" "minecolonies.jar"
cursed_curl "https://media.forgecdn.net/files/3280/126/structurize-0.13.166-ALPHA-universal.jar" "structurize.jar"
cursed_curl "https://media.forgecdn.net/files/3245/79/jei-1.16.5-7.6.1.75.jar" "jei-1.16.5-7.6.1.75.jar"
cursed_curl "https://optifine.net/downloadx?f=preview_OptiFine_1.16.5_HD_U_G8_pre11.jar&x=e549429727bca13d0e36e51242e5bd58" "optifine.jar"
echo "\n ... done"

echo "Installing new Forge ..."
cd $HOME/.minecraft
rm forge*.jar
cursed_curl "https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.5-36.1.0/forge-1.16.5-36.1.0-installer.jar" "forge-installer.jar"
java -jar forge-installer.jar
echo "... done"
