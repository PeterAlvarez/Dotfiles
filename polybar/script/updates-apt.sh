#!/bin/sh

apt=$(apt list --upgradable 2>/dev/null | grep -c actualizable)
flat=$(flatpak update 2>/dev/null | tail -n +5 | grep -Ecv "^$|^Proceed|^Nothing")

if [ "$apt" -gt 0 ] || [ "$flat" -gt 0 ]; then
	echo "  $apt  $flat "
else
	echo " Tux!"
fi
#use
#snap refresh --list
