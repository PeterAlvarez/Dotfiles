#!/bin/bash

# parametro="$estado"
mic_status=$(amixer get Capture | grep '\[on\]')
rojo="%{F#CC240D}"
reset_color="%{F-}"
# Verificar el estado y mostrar el icono correspondiente

if [ -n "$mic_status" ]; then
	echo -e "$rojo$reset_color"
	# pactl set-source-mute "alsa_input.pci-0000_00_1f.3.analog-stereo" 1 && notify-send "Microphone muted "
else
	# pactl set-source-mute "alsa_input.pci-0000_00_1f.3.analog-stereo" 0 && notify-send -u critical "Microphone on "
	echo " "
fi

# click-left = pactl set-source-mute "alsa_input.pci-0000_00_1f.3.analog-stereo" 1 && notify-send "Microphone muted "
# click-right = pactl set-source-mute "alsa_input.pci-0000_00_1f.3.analog-stereo" 0 && notify-send -u critical "Microphone on "
