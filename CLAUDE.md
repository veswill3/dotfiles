# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a **topic-centric dotfiles repository** based on Zach Holman's dotfiles philosophy. The system organizes configuration around different technology areas rather than monolithic config files.

### Key Architectural Principles

- **Topic-based organization**: Each technology area (git, zsh, homebrew, etc.) has its own directory
- **Automatic loading system**: Files are loaded in a specific order based on naming conventions
- **Symlink-based deployment**: Configuration files are symlinked to the home directory via `*.symlink` files
- **Modular installation**: Each topic can have its own installation script

### Loading Order (zsh)

1. **Path files** (`*/path.zsh`) - loaded first for PATH setup
2. **Regular config files** (`*.zsh`) - core configuration  
3. **Completion files** (`*/completion.zsh`) - loaded last for autocomplete

## Common Development Commands

### Initial Setup
```bash
# First-time installation
script/bootstrap

# Install/update all packages and dependencies
script/install

# Maintenance (run periodically)
dot
```

### Maintenance Commands
```bash
# Update system, homebrew, and run installers
dot

# Edit dotfiles in default editor
dot -e

# Reload zsh configuration
reload!

# Jump to project directory (with tab completion)
c <project_name>
```

### Package Management
```bash
# Install Homebrew packages (managed via Brewfile)
brew bundle

# Update Homebrew
brew update && brew upgrade
```

## File Naming Conventions

- **`*.symlink`** - Symlinked to `$HOME` without extension (e.g., `gitconfig.symlink` → `~/.gitconfig`)
- **`*.zsh`** - Loaded into zsh environment automatically
- **`path.zsh`** - Loaded first for PATH modifications
- **`completion.zsh`** - Loaded last for autocomplete setup
- **`install.sh`** - Executed during `script/install`
- **`bin/`** - Scripts added to PATH

## Key Directories and Files

### Core Configuration
- `zsh/zshrc.symlink` - Main zsh configuration that orchestrates loading
- `zsh/zprofile.symlink` - Zsh profile configuration
- `zinit/config.zsh` - Modern Zinit-based plugin management (replaces oh-my-zsh)
- `zinit/aliases.zsh` - Git and modern CLI aliases
- `starship/starship.toml.symlink` - Starship prompt configuration
- `git/gitconfig.symlink` - Git configuration with aliases
- `git/gitconfig.local.symlink` - User-specific git config (created by bootstrap)
- `system/env.zsh` - Environment variables (EDITOR=code, PROJECTS=~/workspace)

### Installation Scripts
- `script/bootstrap` - Primary setup script (git config, symlinks, runs dot)
- `script/install` - Runs homebrew bundle and all topic install.sh scripts
- `bin/dot` - Maintenance script (updates, macOS defaults, installs)

### Package Management
- `Brewfile` - Homebrew package definitions
- `homebrew/install.sh` - Homebrew installation script

## Important Environment Variables

- `$ZSHDOT` - Path to dotfiles directory (`~/.dotfiles`)
- `$PROJECTS` - Project directory for `c` command (`~/workspace`)
- `$EDITOR` - Default editor (`code`)

## Key Aliases and Functions

### Shell Aliases
- `reload!` - Reload zsh configuration
- `cls` - Clear screen
- `c <project>` - Jump to project directory with tab completion
- `e` - Open editor
- `n` - Open notes directory
- `z` / `cd` - Zoxide smart directory navigation
- `zi` / `cdi` - Interactive directory selection with zoxide

### Git Aliases (from git/gitconfig.symlink)
- `gl` - git log with graph
- `gs` - git status
- `gd` - git diff
- `gc` - git commit
- `gco` - git checkout
- `gp` - git push

## Adding New Topics

To add a new topic (e.g., "java"):

1. Create directory: `mkdir java`
2. Add configuration: `java/config.zsh`
3. Add PATH modifications: `java/path.zsh`
4. Add completions: `java/completion.zsh`
5. Add installation: `java/install.sh`
6. Add symlinks: `java/javarc.symlink`

Files will be automatically loaded by the zsh configuration system.

## Modern Terminal Stack (2025)

### Terminal Emulator
- **Ghostty** - Fast, modern terminal with native feel

### Shell Framework  
- **Zinit** - Plugin manager with turbo mode for 80% faster startup
- Replaced oh-my-zsh for better performance (~2.4s → ~50ms startup)

### Prompt
- **Starship** - Blazing fast, customizable prompt written in Rust

### Key Features
- **Enhanced Ctrl+R** - FZF history search with timestamps
- **Syntax highlighting** - Real-time command highlighting
- **Autosuggestions** - Fish-like command suggestions
- **Zoxide** - Smarter cd that learns your habits

## macOS Integration

- `macos/set-defaults.sh` - Sets macOS system defaults
- Homebrew casks install GUI applications to `/Applications`
- Uses macOS keychain for git credentials

## Local Customization

- `~/.localrc` - Local environment variables (sourced by zshrc, not tracked)
- `git/gitconfig.local.symlink` - User-specific git config (created by bootstrap)