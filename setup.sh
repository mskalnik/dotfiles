#!/bin/bash

install_packages() {
    sudo pacman -S -y picom pavucontrol rofi python-pip blueman flatpak neofetch steam htop nvim git thunar ranger unzip ttf-jetbrains-mono bluez bluez-utils
    flatpak install -y flathub com.github.hluk.copyq com.github.johnfactotum.Foliate org.flameshot.Flameshot com.discordapp.Discord com.bitwarden.desktop com.visualstudio.code flathub org.mozilla.firefox
}

configure_bluetooth() {
    systemctl start bluetooth
    pip install dbus-next
}

configure_dotfiles() {
    # TODO: add proper .gitignore for all files
    # and remove those files after git clone
    echo ".dotfiles" >> .gitignore
    git clone --bare git@github.com:mskalnik/dotfiles.git $HOME/.dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    # move all conflicting config files to a backup folder
    mkdir -p .dotfiles-backup && \
        dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
        xargs -I{} mv {} .dotfiles-backup/{}
    dotfiles checkout
    dotfiles config --local status.showUntrackedFiles no
}

configure_monitors() {
    xrandr --output DP-2 --left-of DP-0
}

init() {
    install_packages
    configure_bluetooth
    configure_dotfiles
    configure_monitors
}

init
