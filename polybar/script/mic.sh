#!/bin/bash

# Obtener el estado del micrófono usando amixer
mic_status=$(amixer get Capture | grep '\[on\]')

# Definir los iconos
mic_on_icon="%{F#00FF00} %{F-}"  # Icono verde cuando el micrófono está encendido
mic_off_icon="%{F#FF0000} %{F-}" # Icono rojo cuando el micrófono está apagado

# Verificar el estado y mostrar el icono correspondiente
if [ -n "$mic_status" ]; then
	echo "$mic_on_icon"
else
	echo "$mic_off_icon"
fi
