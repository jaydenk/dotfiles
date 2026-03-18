# Dotfiles

Personal dotfiles and configuration for syncing across macOS and Linux devices.

## Contents

| File/Directory | Description | Deploy to |
|---|---|---|
| `nanorc` | nano editor config (syntax highlighting, UI, editing behaviour) | `~/.nanorc` |
| `tmux.conf` | tmux config (key bindings, statusbar, design) for tmux 3.6+ | `~/.tmux.conf` |
| `Brewfile` | Homebrew packages, casks, and Mac App Store apps (macOS only) | Run `brew bundle` from this directory |
| `fish/config.fish` | Fish shell config (atuin, pyenv) | `~/.config/fish/config.fish` |
| `fish/functions/` | Custom fish functions (flushdns, freshbrew, nano, photoBackup) | `~/.config/fish/functions/` |

## Setup

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script will:
- Symlink all configs to their correct locations
- Back up any existing files before overwriting
- On macOS, optionally run `brew bundle` to install packages

Works on both macOS and Linux. The Brewfile is skipped on Linux automatically.
