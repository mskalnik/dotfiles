#!/bin/bash

# refactor needed
install_pacman() {
    while read line; do
        sudo pacman -S -y $line
    done < ".config/qtile/resources/pacman.list"
}

# refactor needed
install_flatpak() {
    while read line; do
        flatpak install -y flathub $line
    done < ".config/qtile/resources/flatpak.list"
}

install_doom_emacs() {
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
}

configure_dotfiles() {
    dotfiles checkout
    dotfiles config --local status.showUntrackedFiles no
}

configure_ssh() {
    eval $(ssh-agent)
    ssh-add
}

init() {
    install_pacman
    install_flatpak
    install_doom_emacs
    configure_dotfiles
    configure_ssh
}

init
