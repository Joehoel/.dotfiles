# Dotfiles

Configuration files for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

- `.config/nvim/` - Neovim configuration (LazyVim)
- `.config/gh/` - GitHub CLI configuration
- `.config/ghostty/` - Ghostty terminal configuration and themes
- `.gitconfig` - Git configuration
- `Brewfile` - Homebrew packages and casks
- `macos.sh` - macOS system preferences

## Installation on a new Mac

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone this repository

```bash
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles
```

### 3. Install packages via Brewfile

```bash
brew bundle
```

This installs all CLI tools and apps.

### 4. Create symlinks with GNU Stow

Stow is installed via the Brewfile. Create symlinks:

```bash
stow .
```

This creates symlinks in your home directory (`~`) for all files and folders.

### 5. Apply macOS system preferences

```bash
./macos.sh
```

This configures:
- **Dock**: Auto-hide, no animation, scale effect, hot corners
- **Finder**: Show all files/extensions, list view, path bar, status bar
- **Keyboard**: Fast key repeat, function keys as standard, disable autocorrect
- **Trackpad**: Tap to click, three-finger drag, natural scrolling
- **Screenshots**: Save to `~/Pictures/Screenshots` as JPG
- **Menu bar clock**: 24-hour format, show day of week

Some settings require logout or restart to take effect.

### 6. Verify the symlinks

```bash
ls -la ~/.gitconfig
ls -la ~/.config/nvim
ls -la ~/.config/gh
ls -la ~/.config/ghostty
```

## Stow commands

| Command | Description |
|---------|-------------|
| `stow .` | Create symlinks |
| `stow -D .` | Remove symlinks |
| `stow -R .` | Recreate symlinks (remove + create) |
| `stow -n .` | Dry-run (show what would happen) |

## Brewfile management

| Command | Description |
|---------|-------------|
| `brew bundle` | Install everything from Brewfile |
| `brew bundle dump --force` | Export current installation to Brewfile |
| `brew bundle dump --describe` | Export with descriptions |
| `brew bundle cleanup` | Remove packages not in Brewfile |
| `brew bundle check` | Check if everything is installed |

## macOS settings

The `macos.sh` script uses the `defaults` command to configure system preferences. To capture your current settings for a specific domain:

```bash
# Read all settings from a domain
defaults read com.apple.dock

# Read a specific setting
defaults read com.apple.dock autohide

# Write a setting
defaults write com.apple.dock autohide -bool true

# Delete a setting (reset to default)
defaults delete com.apple.dock autohide
```

Common domains:
| Domain | Description |
|--------|-------------|
| `NSGlobalDomain` | Global settings (keyboard, appearance) |
| `com.apple.dock` | Dock settings |
| `com.apple.finder` | Finder settings |
| `com.apple.screencapture` | Screenshot settings |
| `com.apple.AppleMultitouchTrackpad` | Trackpad settings |

## Notes

- The `.stow-local-ignore` contains patterns for ignored files (like README, LICENSE, .git).
- On conflicts: remove existing files before running `stow`.
- The git configuration uses 1Password for SSH signing - make sure it's installed.
