#!/bin/sh
set -e

# TODO: git fetch and check if HEAD == origin/master

export DOTFILES=`dirname $0`
export DOTFILES=`realpath $DOTFILES`

echoStep() {
    echo ""
    echo -e "== $1 =="
}

installYay() {
    echoStep "Installing yay"
    
    mkdir -p "$HOME/.aur"
    pushd "$HOME/.aur"
    if [ ! -d "yay" ]
    then
        git clone https://aur.archlinux.org/yay.git
    fi
    cd yay
    # Shouldnt need this and it may slow down upgrades: git reset --hard
    git pull
    makepkg -si --needed
    popd
}

installShellStartup() {
    echoStep "Installing dotfiles in shells startups"

    BASHRC_FILE="$HOME/.bashrc"
    ZSHRC_FILE="$HOME/.zshrc"

    BASHRC_SOURCE="source $DOTFILES/configs/.bashrc"
    ZSHRC_SOURCE="source $DOTFILES/configs/.zshrc"

    touch $BASHRC_FILE
    touch $ZSHRC_FILE

    grep "$BASHRC_SOURCE" "$BASHRC_FILE" || echo $BASHRC_SOURCE | tee -a $BASHRC_FILE
    grep "$ZSHRC_SOURCE" "$ZSHRC_FILE" || echo $ZSHRC_SOURCE | tee -a $ZSHRC_FILE
}

configureGit() {
    git config --global user.name "Pier-Luc"
    git config --global user.email "pluc.m@outlook.com"
    git config --global core.editor "code --wait"
    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd "code --wait --merge \$REMOTE \$LOCAL \$BASE \$MERGED"
}

installShellStartup