# Giovanni Maria Cusaro's .zshrc - Feel free to use!

# First turn off all beeps
unsetopt BEEP

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export LANG=en_US.UTF-8
export UPDATE_ZSH_DAYS=7
export TERM=xterm-256color

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

ZSH_DISABLE_COMPFIX="true"

# my personal list
plugins=(git osx ruby yarn zsh_reload zsh-autosuggestions zsh-syntax-highlighting emoji brew web-search)

source $ZSH/oh-my-zsh.sh

# User configuration
#export PATH="bin:.:~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

export EDITOR="$HOME/bin/mate -w"

KEYTIMEOUT=0

fpath+=$HOME/.zsh/pure

# Custom PROMPT
autoload -U promptinit; promptinit
prompt pure
PROMPT='%(?.%F{cyan}.%F{red}❯%F{red})▲%f '

# Custom highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Aliases
alias t="touch"
alias m="mkdir"
alias ls="exa -a --icons"
alias lsl="exa -a -l --icons"
alias lst="exa -a -T --git-ignore --icons"
alias app="brew cu"
alias s="spotify"
