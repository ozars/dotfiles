export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_TITLE="true"
plugins=(
  git
  git-extras
  z
  lol
  catimg
  extract
)

source $ZSH/oh-my-zsh.sh
source $HOME/.envrc
