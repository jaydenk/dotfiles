# Dotfiles

Personal dotfiles and configuration for syncing across macOS devices.

## Contents

| File/Directory | Description | Deploy to |
|---|---|---|
| `.nanorc` | nano editor config (syntax highlighting, UI, editing behaviour) | `~/.nanorc` |
| `tmux.conf` | tmux config (key bindings, statusbar, design) for tmux 3.6+ | `~/.tmux.conf` |
| `Brewfile` | Homebrew packages, casks, and Mac App Store apps | Run `brew bundle` from this directory |
| `fish/config.fish` | Fish shell config (atuin, pyenv) | `~/.config/fish/config.fish` |
| `fish/functions/` | Custom fish functions (flushdns, freshbrew, nano, photoBackup) | `~/.config/fish/functions/` |

## Setup

```bash
# Install Homebrew packages
brew bundle

# Symlink configs
ln -sf $(pwd)/.nanorc ~/.nanorc
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish

# Symlink fish functions
for f in fish/functions/*.fish
    ln -sf $(pwd)/$f ~/.config/fish/functions/$(basename $f)
end
```
