#!/bin/sh

tmux new "~/.tmux/plugins/tpm/scripts/install_plugins.sh; exit"

vim -E <<EOL
  :PlugInstall
  :quit
EOL

( cd ~/.vim/plugged/YouCompleteMe/ \
  && python3 install.py \
    --clang-completer --rust-completer --java-completer --go-completer )
