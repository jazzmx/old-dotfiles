#!/usr/bin/env bash
PKGLIST="
build-essential
git
cvs
g++
clang
autoconf
automake
cmake
pkg-config
gettext
libxml2-utils
libevent-dev
libncurses5-dev
libtool
libtool-bin
libgtk-3-dev
python-dev
python-pip
python3-dev
python3-pip
unzip
samba
xsel
schroot
debootstrap
colordiff
exuberant-ctags
meld
gtkterm
spotify-client
"
sudo apt install $PKGLIST

# Add multiarch support
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386

# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Clang packages (for Ubuntu 16.04 - https://apt.llvm.org/)
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt install clang-4.0 clang-4.0-doc libclang-common-4.0-dev libclang-4.0-dev libclang1-4.0 libclang1-4.0-dbg libllvm-4.0-ocaml-dev libllvm4.0 libllvm4.0-dbg lldb-4.0 llvm-4.0 llvm-4.0-dev llvm-4.0-doc llvm-4.0-examples llvm-4.0-runtime clang-format-4.0 python-clang-4.0 libfuzzer-4.0-dev

#
# Build packages from sources
#
PREFIX=/usr/local
BIN_DIR="$HOME/bin"
BUILD_DIR="$HOME/build"
mkdir -p $BIN_DIR $BUILD_DIR
cd $BUILD_DIR

# Packages to install
# bspwm
# sxhkd
# rofi
# tmux
# lf
# bat
# fzf
# ripgrep
# neovim
# flameshot
# copyq
# rclone
# nerd fonts
# dterm
# tabbed (suckless)

# tmux
git clone https://github.com/tmux/tmux.git
(
  cd tmux
  sh autogen.sh
  ./configure && make && sudo make prefix=$PREFIX install
)

# gitsh
curl -OL https://github.com/thoughtbot/gitsh/releases/download/v0.12/gitsh-0.12.tar.gz
(
  cd gitsh-0.12
  ./configure && make && sudo make prefix=$PREFIX install
)

# vte-ng
git clone https://github.com/thestinger/vte-ng.git
(
  sudo apt install autoconf libglib2.0-dev gtk-doc-tools
  cd vte-ng
  sh autogen.sh
  make && sudo make prefix=$PREFIX install
)

# termite
git clone https://github.com/thestinger/termite.git
(
  cd termite
  make && sudo make prefix=$PREFIX install
)

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git
(
  cd fzf
  ./install
)

