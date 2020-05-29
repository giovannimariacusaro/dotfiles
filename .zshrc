# Giovanni Maria Cusaro's .zshrc - Feel free to use!

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/giovanni/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"

# Plugin
plugins=(
  git
  npm
  brew
  osx
  yarn
  fzf
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  gatsby
  history
  emoji
)

source $ZSH/oh-my-zsh.sh

# Alias
alias m="mkdir"
alias t="touch"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
