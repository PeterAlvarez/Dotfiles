#!/bin/bash
tiempo=0.2
tmux new-session -d -t "coding" && sleep $tiempo
tmux rename-window " Music" && sleep $tiempo
tmux new-window -t coding:2 -n " Ranger" && sleep $tiempo
tmux send-keys "ranger" C-m && sleep $tiempo
tmux new-window -t coding:3 -n " Bash" && sleep $tiempo
tmux new-window -t coding:4 -n "󰺧 Testing" && sleep $tiempo
tmux new-window -t coding:5 -n " Dockers" && sleep $tiempo
tmux new-window -t coding:1 -n " Nvim" && sleep $tiempo
tmux send-keys "cd ~/myCode/" C-m && tmux send-keys "nvim" C-m && sleep $tiempo

#tmux new-session -d -t "debug" && sleep $tiempo

# ﱘ       ﭧ    = '      󰐭   '      = ''
