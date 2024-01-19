#!/bin/sh
echo "$(/usr/sbin/ifconfig wlp2s0 | grep "inet " | awk '{print $2}')%{u-}"
