#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +'%Y%m%d%H%M%S')"

backup_dotfiles() {
    echo "|-[START] Backing up dotfiles - $(date)"
    mkdir -p "$BACKUP_DIR" || { echo "Error creating backup directory"; exit 1; }

    for dotfile in "${DOTFILES[@]}"; do
        if [ -f "$HOME/$dotfile" ]; then
            mv "$HOME/$dotfile" "$BACKUP_DIR" || { echo "Error backing up $dotfile"; exit 1; }
            echo "Backed up $dotfile to $BACKUP_DIR"
        fi
    done
    echo "|-[FINISH] Backing up dotfiles - $(date)"
}

install_packages() {
    echo "|-[START] Installing packages - $(date)"
    brew install -y cairo openjdk sbt || { echo "Error installing packages"; exit 1; }
    echo "|-[FINISH] Installing packages - $(date)"
}

setup_ohmyzsh() {
    echo "|-[START] Setting up oh my zsh - $(date)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
        || { echo "Error setting up Oh My Zsh"; exit 1; }
    chsh -s /opt/homebrew/bin/zsh || { echo "Error changing shell"; exit 1; }
    echo "|-[FINISH] Setting up oh my zsh - $(date)"
}

configure_dotfiles() {
    echo "|-[START] Configuring dotfiles - $(date)"
    dotfiles checkout
    dotfiles config --local status.showUntrackedFiles no
    echo "|-[FINISH] Configuring dotfiles - $(date)"
}

main() {
    echo "[START] Installing dotfiles - $(date)"
    backup_dotfiles
    install_packages
    setup_ohmyzsh
    configure_dotfiles
    echo "[FINISH] Installing dotfiles - $(date)"
}

main
