#!/bin/bash

# Lista de layouts y sus iconos correspondientes
layouts=("us" "latam")
icons=(" Us" " Es")  # Puedes cambiar las banderas según el layout
names=("US" "LATAM")

current=$(setxkbmap -query | grep layout | awk '{print $2}')

# Cambiar layout si se invoca con toggle
if [[ "$1" == "toggle" ]]; then
    for i in "${!layouts[@]}"; do
        if [[ "${layouts[$i]}" == "$current" ]]; then
            next_index=$(( (i + 1) % ${#layouts[@]} ))
	    notify-send -t 2000 "Teclado cambiado" "Layout: ${names[$next_index]} ${icons[$next_index]}"
            setxkbmap "${layouts[$next_index]}"
            exit
        fi
    done
fi

# Mostrar icono según layout actual
for i in "${!layouts[@]}"; do
    if [[ "${layouts[$i]}" == "$current" ]]; then
        echo "${icons[$i]}"
        exit
    fi
done

# Si no se encontró, mostrar layout como texto
echo "$current"


