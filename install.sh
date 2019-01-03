#!/bin/sh

DOTFILES="vimrc vim bashrc envrc zshrc tmux.conf"
for conf in $DOTFILES
do
  ln $@ -s "dotfiles/$conf" "$HOME/.$conf"
done
