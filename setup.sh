#!/bin/bash

install_packages() {
    sudo pacman -S -y rofi python-pip blueman flatpak neofetch steam htop vim git thunar ranger unzip ttf-jetbrains-mono bluez bluez-utils
    flatpak install -y flathub com.bitwarden.desktop com.visualstudio.code flathub org.mozilla.firefox
}

configure_qtile() {
    mkdir -p ~/.config/qtile/
    cp /usr/share/doc/qtile/default_config.py ~/.config/qtile/config.py
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
    configure_qtile
    configure_bluetooth
    configure_dotfiles
    configure_monitors
}

init
