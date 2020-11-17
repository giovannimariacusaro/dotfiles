# Giovanni Maria Cusaro's .zshrc - Feel free to use!

# First turn off all beeps
unsetopt BEEP

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export LANG=en_US.UTF-8
export UPDATE_ZSH_DAYS=7
export TERM=xterm-256color

ZSH_THEME=""

HIST_STAMPS="dd/mm/yyyy"

ENABLE_CORRECTION="true"

ZSH_DISABLE_COMPFIX="true"

# my personal list
plugins=(git osx ruby yarn z zsh_reload zsh-autosuggestions zsh-syntax-highlighting gatsby emoji brew)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="bin:.:~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

export EDITOR="$HOME/bin/mate -w"

KEYTIMEOUT=0

# Custom PROMPT
autoload -U promptinit; promptinit
prompt pure
PROMPT='%(?.%F{cyan}.%F{red}❯%F{red})▲%f '

# Custom highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases
alias ohmyconf="open ~/.oh-my-zsh"
alias zshconf="open ~/.zshrc"
alias vimconf="open ~/.vimrc"
alias t="touch"
alias m="mkdir"
alias lsh="ls -ld .?*"
alias tr="tree"
alias app="brew cu"
alias s="spotify"
