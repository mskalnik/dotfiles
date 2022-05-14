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
    install_pacman
    install_flatpak
    install_doom_emacs
    configure_bluetooth
    configure_dotfiles
    configure_monitors
}

init
