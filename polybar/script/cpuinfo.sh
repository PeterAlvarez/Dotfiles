#!/bin/bash
hardinfo &
notify-send "Información de CPU" "$(lscpu)"
