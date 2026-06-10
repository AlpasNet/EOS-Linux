#!/bin/bash

###############################################################
# CHANGE USERNAME
###############################################################

OLD_USER="seijeeos"
NEW_USER="$1"

if [ -z "$NEW_USER" ]; then
    echo "Error : you must put your username."
    echo "Usage : $0 username"
    exit 1
fi

echo "Replacing '$OLD_USER' by '$NEW_USER' ..."

grep -RIl "$OLD_USER" "home" | while read -r file; do
    sed -i "s|$OLD_USER|$NEW_USER|g" "$file"
done

###############################################################
# DOWNLOAD SOFTWARES
###############################################################
wget -O ./home/Programs/GIMP.AppImage "https://download.gimp.org/gimp/v3.2/linux/GIMP-3.2.4-x86_64.AppImage"
wget -O ./home/Programs/OpenShot.AppImage "https://github.com/OpenShot/openshot-qt/releases/download/v3.5.1/OpenShot-v3.5.1-x86_64.AppImagee"
wget -O ./home/Programs/upscayl.AppImage "https://github.com/upscayl/upscayl/releases/download/v2.15.0/upscayl-2.15.0-linux.AppImage"
