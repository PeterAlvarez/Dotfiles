#!/bin/bash
revert() {
	# rm /tmp/*screen*.png
	xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 0 0 5
# scrot -d 1 /tmp/locking_screen.png
# convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
# convert -composite /tmp/screen_blur.png ~/Imágenes/i3lock/2.png -gravity South -geometry -20x1200 /tmp/screen.png
# convert -composite /tmp/screen_blur.png ~/Imágenes/i3lock/2.png -gravity South -geometry -20x1200 /tmp/screen.png
i3lock -i ~/myCode/Dotfiles/i3/images/23.png
revert
