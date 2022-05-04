#!/bin/bash

install_packages() {
    sudo pacman -S flatpak neofetch htop vim firefox git
    flatpak install flathub com.bitwarden.desktop com.visualstudio.code
}

add_qtile_config() {
    mkdir -p ~/.config/qtile/
    cp /usr/share/doc/qtile/default_config.py ~/.config/qtile/config.py
}

install_packages
add_qtile_config
