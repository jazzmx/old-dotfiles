#!/usr/bin/env bash
sudo apt install build-essential git cvs g++ clang autoconf automake cmake pkg-config gettext libxml2-utils libevent-dev libncurses5-dev exuberant-ctags xsel colordiff libtool libtool-bin unzip schroot debootstrap

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386

sudo apt install samba
sudo apt install libgtk-3-dev

# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Python support
sudo apt-get install python-dev python-pip python3-dev python3-pip

# Clang packages (for Ubuntu 16.04 - https://apt.llvm.org/)
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt install clang-4.0 clang-4.0-doc libclang-common-4.0-dev libclang-4.0-dev libclang1-4.0 libclang1-4.0-dbg libllvm-4.0-ocaml-dev libllvm4.0 libllvm4.0-dbg lldb-4.0 llvm-4.0 llvm-4.0-dev llvm-4.0-doc llvm-4.0-examples llvm-4.0-runtime clang-format-4.0 python-clang-4.0 libfuzzer-4.0-dev

# Additional apps
sudo apt install sublime-text meld gtkterm minicom
sudo apt install spotify-client


#
# Build packages from sources
#
BIN_DIR="$HOME/bin"
BUILD_DIR="$HOME/build"
mkdir -p $BIN_DIR $BUILD_DIR
cd $BUILD_DIR

# tmux
git clone https://github.com/tmux/tmux.git
pushd tmux
sh autogen.sh
./configure && make && sudo make prefix=/usr/local install
popd

# xcape
git clone https://github.com/alols/xcape.git
pushd $INSTALL_DIR
make && sudo make prefix=/usr/local install
popd

# Powerline fonts
git clone https://github.com/powerline/fonts.git
pushd fonts
./install.sh
popd
rm -rf fonts

# gitsh
curl -OL https://github.com/thoughtbot/gitsh/releases/download/v0.12/gitsh-0.12.tar.gz
pushd gitsh-0.12
./configure && make && sudo make prefix=/usr/local install
popd

# vte-ng
sudo apt install autoconf libglib2.0-dev gtk-doc-tools
git clone https://github.com/thestinger/vte-ng.git
pushd vte-ng
sh autogen.sh
make && sudo make prefix=/usr/local install
popd

# termite
git clone https://github.com/thestinger/termite.git
pushd termite
make && sudo make prefix=/usr/local install
popd

# fzy
git clone https://github.com/jhawthorn/fzy.git
pushd fzy
make && sudo make prefix=/usr/local install
popd

