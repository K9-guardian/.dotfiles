# vim:foldmethod=marker

# Defaults {{{
export BROWSER='firefox'
export EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
export SUDO_EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
export VISUAL=/home/linuxbrew/.linuxbrew/bin/nvim
# }}}

# XDG {{{
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# }}}

# Manual cleanup {{{
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CHKTEXRC="$XDG_CONFIG_HOME/chktex"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export JAVA_HOME="$XDG_DATA_HOME/jdks/temurin-17.0.4.1"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export TEXMFHOME="$XDG_DATA_HOME/texmf"

export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

export MATLAB_LOG_DIR="$XDG_STATE_HOME/matlab"

export CABAL_DIR="$XDG_CACHE_HOME/cabal"
export GHCUP_USE_XDG_DIRS=true
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
# }}}

# Programs {{{
export FZF_DEFAULT_COMMAND='rg --files'
export HOMEBREW_NO_ENV_HINTS=1
# }}}

# Path {{{
export PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

PATH="$JAVA_HOME/bin:$PATH"
PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"

PATH="$XDG_DATA_HOME/jdtls/bin:$PATH"
source "$XDG_DATA_HOME/cargo/env"
source "$XDG_DATA_HOME/ghcup/env"

PATH="$HOME/.scripts:$PATH"
#}}}

# Source .bashrc if running bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
