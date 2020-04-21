#!/bin/sh
#
# resize - resize window in a given direction

pix=10
# set a smaller percentage when floating
bspc query -N -n focused.floating > /dev/null && pix=5

case $1 in
    east)  dim=w; dir=right; falldir=left;   sign=+;;
    west)  dim=w; dir=right; falldir=left;   sign=-;;
    north) dim=h; dir=top;   falldir=bottom; sign=-;;
    south) dim=h; dir=top;   falldir=bottom; sign=+;;
esac

# get a percentage of the monitor resolution
# var=$((`wattr "$dim" "$(lsw -r)"` * percent / 100))


case $dim in
    w) x=$sign$pix; y=0;;
    h) y=$sign$pix; x=0;;
esac

# try to resize in one direction
# fall back to the other if it fails
bspc node -z "$dir" "$x" "$y" || bspc node -z "$falldir" "$x" "$y"

# cursor

