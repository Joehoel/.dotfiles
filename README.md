# Dotfiles

Configuration files for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

- `.config/nvim/` - Neovim configuration (LazyVim)
- `.config/gh/` - GitHub CLI configuration
- `.config/ghostty/` - Ghostty terminal configuration and themes
- `.gitconfig` - Git configuration
- `Brewfile` - Homebrew packages and casks

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

### 5. Verify the symlinks

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

## Notes

- The `.stow-local-ignore` contains patterns for ignored files (like README, LICENSE, .git).
- On conflicts: remove existing files before running `stow`.
- The git configuration uses 1Password for SSH signing - make sure it's installed.
