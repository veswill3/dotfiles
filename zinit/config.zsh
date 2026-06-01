# Zinit configuration

# Set ZINIT home
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if it's not there
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# Essential plugins with Turbo mode for faster loading
# Syntax highlighting - load it early but not too early
zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
    blockf \
    zsh-users/zsh-completions

# Git extras - lazy load after 1 second
zinit wait"1" lucid for \
    OMZP::git \
    OMZP::git-extras

# FZF integration with enhanced history search
zinit wait lucid for \
    atclone"mkdir -p ~/.config/fzf" \
    atpull"%atclone" \
    junegunn/fzf

# Enhanced fzf history search with timestamps
zinit wait lucid for \
    joshskidmore/zsh-fzf-history-search

# History substring search - use arrows to search through history
zinit wait lucid atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down" for \
    zsh-users/zsh-history-substring-search

# Load fzf shell integration
zinit wait lucid atload"source <(fzf --zsh)" for \
    zdharma-continuum/null


