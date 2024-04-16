# vim:foldmethod=marker

# Defaults {{{
export BROWSER=/usr/bin/firefox
export EDITOR=nvim
export VISUAL=nvim
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
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export JAVA_HOME="$XDG_DATA_HOME/jdks/temurin-17.0.4.1"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export TEXMFHOME="$XDG_DATA_HOME/texmf"

export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

export MATLAB_LOG_DIR="$XDG_STATE_HOME/matlab"

export CABAL_DIR="$XDG_CACHE_HOME/cabal"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
# }}}

# Programs {{{
export FZF_DEFAULT_COMMAND='rg --files'
export HOMEBREW_NO_ENV_HINTS=1
export LOCATE_PATH="$XDG_DATA_HOME/plocate.db"
# }}}

# Path {{{
export PATH

[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

PATH="$JAVA_HOME/bin:$PATH"
PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"

[ -f "$XDG_DATA_HOME/cargo/env" ] && . "$XDG_DATA_HOME/cargo/env"
PATH="$XDG_DATA_HOME/ispc/bin:$PATH"
PATH="$XDG_DATA_HOME/jdtls/bin:$PATH"
PATH="$XDG_DATA_HOME/julia/bin:$PATH"
PATH="$XDG_DATA_HOME/npm/bin:$PATH"
PATH="$XDG_DATA_HOME/scryer-prolog/target/release:$PATH"

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"
PATH="$HOME/.local/kitty.app/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.scripts:$PATH"
#}}}

[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
