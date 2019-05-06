export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

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
source $ZSH_CUSTOM/agnoster-patch.zsh
source $HOME/.envrc
if [ -f "$HOME/.local.envrc" ]; then
  source $HOME/.local.envrc
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
