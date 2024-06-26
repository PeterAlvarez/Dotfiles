#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 3; done

# Launch
polybar darlene &
polybar samsung &
# polybar LinusTorballzz

echo "Bar launched..."
