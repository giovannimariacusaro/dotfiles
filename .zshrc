# Giovanni Maria Cusaro's .zshrc - Feel free to use!

# Path to your oh-my-zsh installation.
export ZSH="/Users/giovanni/.oh-my-zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH="/Users/giovanni/.oh-my-zsh"

# Auto-update
export UPDATE_ZSH_DAYS=7

# Set colors
export TERM=xterm-256color

# Theme
ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

# Plugin
plugins=(
  git
  osx
  yarn
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  gatsby
  emoji
)

# Generic aliases
alias ohmyzsh="open ~/.oh-my-zsh"
alias zshconf="open ~/.zshrc"
alias t="touch"
alias m="mkdir"
alias lsh="ls -ld .?*"

alias tr="tree"