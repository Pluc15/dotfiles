#!/bin/sh
set -e

mkdir -p "$HOME/.aur"
pushd "$HOME/.aur"
if [ ! -d "yay" ]
then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
git pull
makepkg -si --needed
popd
