setup_ohmyzsh() {
    echo "-[START] Setting up oh my zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s /opt/homebrew/bin/zsh
    echo "-[FINISH] Setting up oh my zsh"
}

install_packages() {
    echo "-[START] Installing packages"
    brew install -y cairo openjdk sbt
    echo "-[FINISH] Installing packages"
}

backup_dotfiles() {
    echo "-[START] Backing up dotfiles"
    DOTFILES_DIR="$HOME/dotfiles"
    BACKUP_DIR="$HOME/dotfiles_backup_$(date +'%Y%m%d%H%M%S')"
    mkdir -p "$BACKUP_DIR"

    for dotfile in "${DOTFILES[@]}"; do
        if [ -f "$HOME/$dotfile" ]; then
            mv "$HOME/$dotfile" "$BACKUP_DIR"
            echo "Backed up $dotfile to $BACKUP_DIR"
        fi
    done
    echo "-[FINISH] Backing up dotfiles"
}

main() {
    echo "[START] Installing dotfiles"
    backup_dotfiles
    install_packages
    setup_ohmyzsh
    echo "[FINISH] Installing dotfiles"
}

main
