#!/bin/sh
set -e

# TODO: git fetch and check if HEAD == origin/master

export DOTFILES=`dirname $0`
export DOTFILES=`realpath $DOTFILES`

echoStep() {
    echo ""
    echo -e "== $1 =="
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

installBrew() {
    echoStep "Installing Homebrew"
    
    brew --version | grep -q "Homebrew" || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # TODO Do I need to source something so it works in this session?
    brew update
}

installPackages() {
    echoStep "Installing packages"

    brew install fzf
}

installShellStartup
installBrew
installPackages
echoStep "Done!"
