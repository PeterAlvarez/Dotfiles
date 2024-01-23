#!/bin/bash

# Mostrar cuadro de diálogo para obtener el término de búsqueda
search_term=$(yad --entry --title "Búsqueda en Google Chrome" --text "  Ingresa el término de búsqueda:" --width 350)

# Verificar si el usuario ingresó un término de búsqueda o canceló el cuadro de diálogo
if [ $? -eq 0 ]; then
	# Ejecutar el script de búsqueda en Chrome con el término proporcionado
	flatpak run com.google.Chrome https://www.google.com/search?q="$search_term"
else
	# El usuario canceló el cuadro de diálogo
	yad --info --title "Búsqueda en Google Chrome" --text "Cancelaste el cuadro de diálogo. ¡Hasta luego!"
fi
