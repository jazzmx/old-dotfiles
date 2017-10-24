#!/bin/bash
#
#  Install tools & development environment
#

# Install build tools & libs
sudo apt-get install build-essential git cmake autotools

# Install tmux v2.x


# Install xcape
# make CapsLock behave like Ctrl when held:
#   setxkbmap -option ctrl:nocaps
# make short-pressed CapsLock behave like Escape:
#   xcape -e 'Control_L=Escape'
# Revert Caps_Lock key in case of problem
#   xmodmap -e 'keycode 0x42 = Caps_Lock'
#
sudo apt-get install pkg-config libx11-dev libxtst-dev libxi-dev
git clone https://github.com/alols/xcape.git ~/bin/xcape
make -C ~/bin/xcape && sudo make -C ~/bin/xcape prefix=/usr/local install

# Install neovim
sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
git clone https://github.com/neovim/neovim.git ~/bin/neovim
make && sudo make install


