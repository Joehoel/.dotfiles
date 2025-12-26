# Dotfiles

Configuratiebestanden voor macOS, beheerd met [GNU Stow](https://www.gnu.org/software/stow/).

## Inhoud

- `.config/nvim/` - Neovim configuratie (LazyVim)
- `.config/gh/` - GitHub CLI configuratie
- `.gitconfig` - Git configuratie
- `Brewfile` - Homebrew packages, casks en VS Code extensies

## Installatie op een nieuwe Mac

### 1. Installeer Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone deze repository

```bash
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles
```

### 3. Installeer packages via Brewfile

```bash
brew bundle
```

Dit installeert alle CLI tools, apps en VS Code extensies.

### 4. Installeer GNU Stow en maak symlinks

```bash
brew install stow
```

Stow wordt meegeïnstalleerd via de Brewfile. Maak symlinks aan:

```bash
stow .
```

Dit maakt symlinks aan in je home directory (`~`) voor alle bestanden en mappen.

### 5. Verifieer de symlinks

```bash
ls -la ~/.gitconfig
ls -la ~/.config/nvim
ls -la ~/.config/gh
```

## Stow commando's

| Commando | Beschrijving |
|----------|--------------|
| `stow .` | Symlinks aanmaken |
| `stow -D .` | Symlinks verwijderen |
| `stow -R .` | Symlinks opnieuw aanmaken (verwijderen + aanmaken) |
| `stow -n .` | Dry-run (laat zien wat er zou gebeuren) |

## Brewfile beheren

| Commando | Beschrijving |
|----------|--------------|
| `brew bundle` | Installeer alles uit Brewfile |
| `brew bundle dump --force` | Exporteer huidige installatie naar Brewfile |
| `brew bundle dump --describe` | Exporteer met beschrijvingen |
| `brew bundle cleanup` | Verwijder packages die niet in Brewfile staan |
| `brew bundle check` | Controleer of alles geïnstalleerd is |

## Opmerkingen

- De `.stow-local-ignore` bevat patronen voor bestanden die genegeerd worden (zoals README, Brewfile, LICENSE, .git).
- Bij conflicten: verwijder eerst bestaande bestanden voordat je `stow` uitvoert.
- De git configuratie verwijst naar 1Password voor SSH signing - zorg dat dit geïnstalleerd is.
