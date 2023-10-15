#!/bin/bash

backup_dotfiles() {
    echo "-[START] Backing up dotfiles - $(date)"
    DOTFILES_DIR="$HOME/dotfiles"
    BACKUP_DIR="$HOME/dotfiles_backup_$(date +'%Y%m%d%H%M%S')"
    mkdir -p "$BACKUP_DIR"

    for dotfile in "${DOTFILES[@]}"; do
        if [ -f "$HOME/$dotfile" ]; then
            mv "$HOME/$dotfile" "$BACKUP_DIR"
            echo "Backed up $dotfile to $BACKUP_DIR"
        fi
    done
    echo "-[FINISH] Backing up dotfiles - $(date)"
}

install_packages() {
    echo "-[START] Installing packages - $(date)"
    brew install -y cairo openjdk sbt
    echo "-[FINISH] Installing packages - $(date)"
}

setup_ohmyzsh() {
    echo "-[START] Setting up oh my zsh - $(date)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s /opt/homebrew/bin/zsh
    echo "-[FINISH] Setting up oh my zsh - $(date)"
}

main() {
    echo "[START] Installing dotfiles - $(date)"
    backup_dotfiles
    install_packages
    setup_ohmyzsh
    echo "[FINISH] Installing dotfiles - $(date)"
}

main
