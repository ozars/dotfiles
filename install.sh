#!/bin/bash

MYFONT="InconsolataGo NF 13"
DOTFILES="vimrc vim bashrc envrc zshrc oh-my-zsh tmux.conf fonts"
for conf in $DOTFILES
do
  ln -s -n $@ "dotfiles/$conf" "$HOME/.$conf"
done

# Font configuration
fc-cache
dpkg -s libglib2.0-bin >/dev/null 2>&1 || {
  echo "Installing gsettings..."
  sudo apt-get install -y libglib2.0-bin
}
gprofile_schema="org.gnome.Terminal.Legacy.Profile"
gprofile_path=`gsettings get org.gnome.Terminal.ProfilesList default`
gprofile_path="/org/gnome/terminal/legacy/profiles:/:${gprofile_path:1:-1}/"
gsettings set "$gprofile_schema:$gprofile_path" "use-system-font" "false"
gsettings set "$gprofile_schema:$gprofile_path" "font" "'$MYFONT'"
