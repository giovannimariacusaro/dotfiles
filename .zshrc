# Giovanni Maria Cusaro's .zshrc - Feel free to use!

# First turn off all beeps
unsetopt BEEP

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git osx ruby yarn z zsh_reload zsh-autosuggestions zsh-syntax-highlighting gatsby emoji)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="bin:.:~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# 10ms for key sequences
KEYTIMEOUT=1

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Generic aliases
alias ohmyconf="open ~/.oh-my-zsh"
alias zshconf="open ~/.zshrc"
alias vimconf="open ~/.vimrc"
alias t="touch"
alias m="mkdir"
alias lsh="ls -ld .?*"
alias update="brew cu"
alias tr="tree"

PROMPT='%. '
unsetopt PROMPT_SP

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="bin:$PATH"
export EDITOR="$HOME/bin/mate -w"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
