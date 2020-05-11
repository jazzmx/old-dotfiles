#!/bin/sh

# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. I keep those commands in ~/.xprofile because that
# file is run automatically if someone uses a display manager (login screen)
# and so they are needed there. To prevent doubling up commands, I source them
# here with the line below.
# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

setxkbmap -layout us,ca -variant ,multix -option grp:alt_shift_toggle -option ctrl:nocaps
# Change from ugly 'X' cursor when hovering over background

~/.config/polybar/launch.sh &
sxhkd &
exec bspwm

