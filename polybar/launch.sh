#!/bin/bash

killall -q polybar

# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# nm-applet &
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# setxkbmap es
polybar laptop &
polybar samsung &
# polybar lg &
