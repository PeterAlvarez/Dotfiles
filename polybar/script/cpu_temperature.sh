#!/bin/sh

# Este script obtiene la temperatura del CPU (Package ID) y la muestra con un icono.

# Comando para obtener la temperatura del CPU (solo el número)
CPU_TEMP=$(sensors | grep "Package id" | awk '{print substr($4, 2, length($4)-5)}')

# Verifica si se obtuvo una temperatura
if [ -n "$CPU_TEMP" ]; then
    echo " $CPU_TEMP°C"
else
    echo " N/A" # En caso de que no se detecte la temperatura
fi
