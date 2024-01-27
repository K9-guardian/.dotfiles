# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*)
    ;;
  *)
    return
    ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/fzf ]; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
  source /usr/share/doc/fzf/examples/completion.bash
fi

[ -x /usr/bin/git ] && source /usr/share/bash-completion/completions/git

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color)
    color_prompt=yes
    ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  LITTLE_MAN='$(if [ $? = 0 ]; then echo "\[\e[32m\]\\o/\[\e[0m\]"; else echo "\[\e[31m\]/o\\\[\e[0m\]"; fi)'
  PS1="${debian_chroot:+($debian_chroot)}($LITTLE_MAN):\w $ "
else
  PS1='${debian_chroot:+($debian_chroot)}\w $ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  # alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

if [ -x "$XDG_DATA_HOME/cargo/bin/lsd" ]; then
  alias ls='lsd --group-directories-first'
  alias la='ls -a'
  alias ll='ls -la'
  alias tree='ls --tree'
fi

if [ -x /usr/bin/nvim ]; then
  alias ex='nvim -e'
  alias vi='nvim'
  alias view='nvim -R'
  alias vim='nvim'
  alias vimdiff='nvim -d'
fi

[ -x /usr/bin/bat ] && alias cat='bat'
[ -x "$HOME/.local/kitty.app/bin/kitten" ] && alias icat='kitten icat --align left'
[ -x "$HOME/.local/kitty.app/bin/kitty"  ] && alias ssh='kitty +kitten ssh'

alias ..='cd ..'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias gr='cd "$(git rev-parse --show-toplevel)"'
