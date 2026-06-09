#!/bin/sh
set -e

export DOTFILES=`dirname $0`
export DOTFILES=`realpath $DOTFILES/..`
BASHRC_FILE="$HOME/.bashrc"
BASHRC_SOURCE="source $DOTFILES/configs/.bashrc"
touch $BASHRC_FILE
grep "$BASHRC_SOURCE" "$BASHRC_FILE" || echo $BASHRC_SOURCE | tee -a $BASHRC_FILE
