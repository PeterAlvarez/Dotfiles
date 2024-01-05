#!/bin/bash
while true; do
	battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	if [ $battery_level -ge 95 ]; then
		notify-send -t 5000 "Bateria Casi Llena" "Nivel: ${battery_level}%"
	elif [ $battery_level -le 30 ]; then
		notify-send -t 10000 --urgency=CRITICAL "Bateria Baja" "Nivel: ${battery_level}%"
		paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
	fi
	sleep 120
done
