#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
OS="$(uname -s)"

link() {
    local src="$1"
    local dest="$2"
    local dest_dir
    dest_dir="$(dirname "$dest")"

    mkdir -p "$dest_dir"

    if [ -L "$dest" ]; then
        rm "$dest"
    elif [ -e "$dest" ]; then
        echo "  Backing up existing $dest to ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi

    ln -sf "$src" "$dest"
    echo "  Linked $dest -> $src"
}

echo "Installing dotfiles from $DOTFILES"
echo "Detected OS: $OS"
echo ""

# nano
echo "[nano]"
link "$DOTFILES/nanorc" "$HOME/.nanorc"

# tmux
echo "[tmux]"
link "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"

# fish
echo "[fish]"
link "$DOTFILES/fish/config.fish" "$HOME/.config/fish/config.fish"
for f in "$DOTFILES"/fish/functions/*.fish; do
    link "$f" "$HOME/.config/fish/functions/$(basename "$f")"
done

# macOS-only
if [ "$OS" = "Darwin" ]; then
    echo ""
    echo "[homebrew]"
    if command -v brew &>/dev/null; then
        read -p "  Run brew bundle to install packages? [y/N] " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            brew bundle --file="$DOTFILES/Brewfile"
        else
            echo "  Skipped."
        fi
    else
        echo "  Homebrew not installed. Skipping Brewfile."
        echo "  Install from https://brew.sh then re-run this script."
    fi
fi

echo ""
echo "Done."
