#!/bin/bash
hardinfo2 &
notify-send "Información de CPU" "$(lscpu)"
