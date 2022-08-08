#!/bin/bash

install_pacman() {
    while read line; do
        sudo pacman -S -y $line
    done < ".config/qtile/resources/pacman.list"
}

install_flatpak() {
    while read line; do
        flatpak install -y flathub $line
    done < ".config/qtile/resources/flatpak.list"
}

install_snap() {
    while read line; do
        snap install -y $line
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

configure_commit() {
    git config --global core.editor "flatpak run --file-forwarding re.sonny.Commit @@"
}

remove_leftovers() {
    rm LICENSE setup.sh README.md
}

init() {
    install_pacman
    install_flatpak
    install_flatpak
    install_doom_emacs
    configure_dotfiles
    configure_commit
    remove_leftovers
}

init
