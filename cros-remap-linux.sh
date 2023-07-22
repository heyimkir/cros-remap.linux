#!/bin/bash
#
# Script to Fix and apply Tweaks to Chromebooks running Linux
#

# get CB model codename
CBCODENAME=$(sudo dmidecode -s system-product-name)

## functions ##
key-remapper() {
	# make backup of original pc config file
	sudo cp -n /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc.bck

	# copy new pc config file
	sudo cp pc /usr/share/X11/xkb/symbols/

	# update config
	sudo rm -rf /var/lib/xkb/*
}
## ..functions ##

# download supporting files
echo Downloading the map.
curl -LOk https://github.com/heyimkir/cros-remap.linux/releases/download/mapfile-v1/pc.zip
unzip pc.zip



# apply keyboard remapping
key-remapper
echo "Remapped the top row media keys."

## reboot
read -p "Your Chromebook will now reboot! Press any key to continue..."
sudo shutdown -r now
