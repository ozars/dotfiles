#!/bin/bash

MYFONT="InconsolataGo NF 13"
DOTFILES=(
  vimrc vim bashrc envrc zshrc oh-my-zsh oh-my-zsh-custom tmux.conf tmux fonts gdbinit
)
for conf in ${DOTFILES[*]}
do
  ln -s -n $@ "`realpath --relative-to=""$HOME"" ""$(dirname $0)""/$conf""`" "$HOME/.$conf"
done

# gnome-terminal configuration
if [ -z $SKIP_GNOME ] || [ "$SKIP_GNOME" -eq 0 ]; then
  dpkg -s libglib2.0-bin >/dev/null 2>&1 || {
    echo "Installing gsettings..."
    sudo apt-get install -y libglib2.0-bin
  }

  gprofile_schema="org.gnome.Terminal.Legacy.Profile"
  gprofile_path=`gsettings get org.gnome.Terminal.ProfilesList default`
  gprofile_path="/org/gnome/terminal/legacy/profiles:/:${gprofile_path:1:-1}/"
  function gprofile()
  {
    if [ "$#" -eq 1 ]
    then
      gsettings get "$gprofile_schema:$gprofile_path" "$1"
      return $?
    elif [ "$#" -eq 2 ]
    then
      gsettings set "$gprofile_schema:$gprofile_path" "$1" "$2"
      return $?
    else
      2> echo "Unknown arguments for gsettings: $@"
      exit 1
    fi
  }

  # Font configuration
  fc-cache "$HOME/.fonts"
  gprofile "font" "'$MYFONT'"
  gprofile "use-system-font" "false"

  # Color palette configuration (solarized)
  gprofile "background-color" 'rgb(0,43,54)'
  gprofile "foreground-color" "'rgb(131,148,150)'"
  gprofile "palette" "['rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']"
  gprofile "use-theme-colors" "false"
fi
