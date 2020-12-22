#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
nm-applet &
setxkbmap es
polybar samsung &
polybar laptop &
polybar lg &
