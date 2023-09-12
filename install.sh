setup_ohmyzsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s /opt/homebrew/bin/zsh
}

backup_dotfiles() {
    DOTFILES_DIR="$HOME/dotfiles"
    BACKUP_DIR="$HOME/dotfiles_backup_$(date +'%Y%m%d%H%M%S')"
    mkdir -p "$BACKUP_DIR"

    for dotfile in "${DOTFILES[@]}"; do
        if [ -f "$HOME/$dotfile" ]; then
            mv "$HOME/$dotfile" "$BACKUP_DIR"
            echo "Backed up $dotfile to $BACKUP_DIR"
        fi
    done
}

main() {
    echo "Installing dotfiles..."
    backup_dotfiles
    setup_ohmyzsh
    echo "Dotfiles installation complete!"
}

main
