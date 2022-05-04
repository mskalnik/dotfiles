#!/bin/bash

install_packages() {
    sudo pacman -S flatpak neofetch htop vim firefox git thunar ranger unzip ttf-jetbrains-mono bluez bluez-utils
    flatpak install flathub com.bitwarden.desktop com.visualstudio.code
}

configure_qtile() {
    mkdir -p ~/.config/qtile/
    cp /usr/share/doc/qtile/default_config.py ~/.config/qtile/config.py
}

configure_bluetooth() {
    systemctl start bluetooth
}

init() {
    install_packages
    configure_qtile
    configure_bluetooth
}

init