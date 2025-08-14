#!/bin/bash
tiempo=0.3
tiempoT=0.2
tmux new-session -d -t "coding" && sleep $tiempo

tmux rename-window " Git" && sleep $tiempo
tmux send-keys "lazygit" C-m && tmux send-keys "N" C-m && sleep $tiempo

tmux new-window -t coding:2 -n "  Files" && sleep $tiempo
tmux send-keys "rr" C-m && sleep $tiempo

tmux new-window -t coding:3 -n " Bash" && sleep $tiempo
tmux send-keys "clear" C-m && sleep $tiempoT

tmux new-window -t coding:4 -n " Run" && sleep $tiempo
tmux send-keys "clear" C-m && sleep $tiempoT

tmux new-window -t coding:5 -n " Dockers" && sleep $tiempo
tmux send-keys "clear" C-m && sleep $tiempoT

tmux new-window -t coding:8 -n " DBase" && sleep $tiempo
tmux send-keys "clear" C-m && sleep $tiempoT

tmux new-window -t coding:9 -n " Notes" && sleep $tiempo
tmux send-keys "nvim ~/myCode/notes/chuletas/" C-m && sleep $tiempo

tmux new-window -t coding:1 -n " Nvim" && sleep $tiempo
tmux send-keys "nvim ~/myCode/" C-m && sleep $tiempo

#tmux send-keys "cd ~/myCode/" C-m && tmux send-keys "nvim" C-m && sleep $tiempo
#tmux new-session -d -t "debug" && sleep $tiempo

# ﱘ       ﭧ    = '      󰐭   '      = ''
