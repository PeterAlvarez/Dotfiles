#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

xcompmgr -c &
run setxkbmap es
run nm-applet &
#run blueman-applet
run synapse &

tilda &
