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

installPackages() {
    echoStep "Installing packages"

    # TODO I'm due for a package cleanup - I don't use a lot of those anymore
    # TODO Split the packages for desktop environment - I use this dotfile on my server as well
    yay -Syu \
    --needed \
    --removemake \
    --answerclean y \
    --answerupgrade y \
    --answerdiff n \
    --answeredit n \
    arandr \
    arch-audit \
    aspnet-runtime \
    aur/android-emulator \
    aur/azure-cli \
    aur/jetbrains-toolbox \
    aur/nvm \
    aur/snapd \
    aur/yay \
    aur/mongodb-compass \
    aur/webtorrent-desktop-bin \
    bluez \
    bluez-tools \
    bluez-utils \
    brightnessctl \
    cbatticon \
    cheese \
    chromium \
    cifs-utils \
    code \
    compton \
    curl \
    deluge \
    discord \
    docker \
    dotnet-host \
    dotnet-runtime \
    dotnet-sdk \
    dunst \
    efibootmgr \
    feh \
    fish \
    freerdp \
    fzf \
    gimp \
    git \
    glances \
    gparted \
    gufw \
    htop \
    i3-gaps \
    i3lock \
    i3status \
    imagemagick \
    lastpass-cli \
    lib32-nvidia-utils \
    lib32-vulkan-icd-loader \
    libreoffice \
    lm_sensors \
    lutris \
    neofetch \
    network-manager-applet \
    networkmanager \
    networkmanager-openvpn \
    networkmanager-pptp \
    nitrogen \
    nm-connection-editor \
    nodejs \
    npm \
    ntfs-3g \
    nvidia \
    nvidia-settings \
    nvidia-utils \
    obs-studio \
    opencl-nvidia \
    openssh \
    pacman-contrib \
    pacman-contrib \
    pacman-mirrorlist \
    pamixer \
    paprefs \
    pasystray \
    pavucontrol \
    polkit \
    polkit-gnome \
    pulseaudio \
    pulseaudio-alsa \
    pulseaudio-bluetooth \
    pulseaudio-jack \
    pulseeffects \
    qt5ct \
    redshift \
    remmina \
    rofi \
    rsync \
    rxvt-unicode \
    s-tui \
    scrot \
    speedtest-cli \
    steam \
    steam-native-runtime \
    thunar \
    tk \
    transmission-cli \
    transmission-gtk \
    ttf-fira-code \
    ttf-font-awesome \
    tumbler \
    viewnior \
    vlc \
    vulkan-icd-loader \
    wget \
    xclip \
    xdotool \
    xorg \
    xorg-apps \
    xorg-xbacklight \
    xorg-xinit \
    yarn
}

runAudit() {
    echoStep "Running arch-audit"
    arch-audit
    echo "READ THE AUDIT RESULT then press any key to continue..."
    read
}

installShellStartup
installYay
installPackages
runAudit
echoStep "Done!"
