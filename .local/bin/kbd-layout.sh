#!/usr/bin/env bash

layout=$@
current="$(setxkbmap -query | sed -rn 's/layout\:[ ]+(.*)$/\1/p')"
us="us"
ca="ca -variant multix"

[ "$layout" ] && {
   setxkbmap $layout
} || {
   [ "$current" = us ] && setxkbmap $ca || setxkbmap $us
}

# Enable digraphs
setxkbmap -option compose:ralt
setxkbmap -query | sed -rn 's/layout\:[ ]+(.*)$/\1/p'

