#!/usr/bin/env bash
#
# Script to logout, shutdown or reboot of certain window managers
# Mainly for use with other scripts by passing the arguments
#
# Written by Nathaniel Maia, January 2018

readonly NAME="$(basename "$0")"

usage() {
    cat <<EOF
USAGE:
    $NAME [OPTION]

OPTIONS:
    logout        Exit to a display manager or console
    reboot        Shut down and reboot the system
    shutdown      Shut down and power-off the system
    Without options, the dialog will be opened in either rofi or dmenu.

EXAMPLES:
    rofi:
          $NAME <<< "\$(echo -e 'Logout\nReboot\nShutdown' | rofi -dmenu -i -p 'System')"
    dmenu:
          $NAME <<< "\$(echo -e 'Logout\nReboot\nShutdown' | dmenu -i -p 'System')"
EOF
}

current_wm() {
    if ! [[ $WM ]]; then
        WMS=(openbox dwm i3 bspwm xfce)
        for i in "${WMS[@]}"; do
            if [[ $(wmctrl -m | grep -i 'name' | awk '{print tolower($2)}') == "$i" ]]; then
                WM=$i && break
            elif [[ $(xprop -root _NET_WM_NAME | awk '{print tolower($3)}') == "$i" ]]; then
                WM=$i && break
            elif [[ "$(awk '{print tolower($0)}' <<< "$XDG_CURRENT_DESKTOP")" == "$i" ]]; then
                WM=$i && break
            fi
        done
    fi
}

decide() {
    local msg='Logout\nReboot\nShutdown'

    if hash rofi &>/dev/null; then
        ANS="$(echo -e "$msg" | rofi -p 'System' -dmenu -i -width 20 -lines 3)"
    elif hash dmenu &>/dev/null; then
        ANS="$(echo -e "$msg" | dmenu -i -nb '#4D545E' -nf '#B6B6B6' -sb '#4D545E' -sf '#5DD5FF')"
    fi

    [[ $ANS ]] && $NAME "$ANS" || return 0
}

_logout() {
    current_wm

    case $WM in
        i3)      i3-msg exit                   ;;
        xfce)    xfce4-session-logout --logout ;;
        openbox) openbox --exit                ;;
        dwm)
            if pgrep -a xinit | grep -q "$HOME/.xinitrc"; then
                pkill xinit
            else
                pkill dwm
            fi
            ;;
        bspwm)
            for id in $(bspc query -W); do
                bspc window "$id" -c
            done
            pkill sxhkd
            bspc quit
            ;;
        *) echo "WM not yet supported"
    esac
}

case $1 in
    *[lL]ogout*)   _logout  ;;
    *[rR]eboot*)   reboot   ;;
    *[sS]hutdown*) poweroff ;;
    -h|--help)     usage    ;;
    *)             decide
esac

exit 0
