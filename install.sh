#!/bin/sh

DOTFILES="vimrc vim bashrc envrc zshrc oh-my-zsh tmux.conf"
for conf in $DOTFILES
do
  ln $@ -s "dotfiles/$conf" "$HOME/.$conf"
done
