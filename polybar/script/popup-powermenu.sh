#!/bin/sh

case "$1" in
--popup)
	yad=$(yad --width 300 --entry --undecorated --title "System Logout" --image=gnome-shutdown --text "Choose action:" --entry-text " Shutdown" " Reboot" " Logout" " Block" " Tux" "⏾ Suspend")

	case "$yad" in
	" Shutdown")
		systemctl poweroff
		;;
	" Reboot")
		systemctl reboot
		;;
	" Logout")
		i3-msg exit
		;;
	" Block")
		i3lock-fancy
		;;
	" Tux")
		~/myCode/Dotfiles/scripts/i3-wm/i3lock.sh
		;;
	" ⏾ Suspend")
		systemctl suspend
		;;
	esac
	;;
*)
	echo " "
	;;
esac
