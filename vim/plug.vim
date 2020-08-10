call plug#begin('~/.vim/plugged')

" Themes
Plug 'altercation/vim-colors-solarized'

" Syntax
Plug 'sheerun/vim-polyglot'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A Vim plugin which shows git diff markers in the sign column and
" stages/previews/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

" Things you can do with fzf and vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" The fancy start screen for Vim
Plug 'mhinz/vim-startify'

" Open from quick-fix-list in new split
Plug 'yssl/QFEnter'

" Respect .editorconfig files. (http://editorconfig.org/)
Plug 'editorconfig/editorconfig-vim'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Comment functions so powerful—no comment necessary
Plug 'scrooloose/nerdcommenter'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" Show buffers on lightline (depends lightline)
Plug 'mengelbrecht/lightline-bufferline'

" Intellisense engine for Vim8 & Neovim, full LSP support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" coc diagnostics indicator for the lightline vim plugin
Plug 'josa42/vim-lightline-coc'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-repeat'

" This simple plugin will strip the trailing whitespace from the file you are
" editing. However, it does this only on the lines you edit or visit in Insert
" mode; it leaves all the others untouched.
Plug 'thirtythreeforty/lessspace.vim'

" Recover.vim adds a diff option when Vim finds a swap file
Plug 'chrisbra/Recover.vim'

" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree'

" Vim-tmux navigation integration
Plug 'christoomey/vim-tmux-navigator'

" FocusGained and FocusLost autocommand events are not working in terminal vim.
" This plugin restores them when using vim inside Tmux.
Plug 'ozars/vim-tmux-focus-events'

" Seamless integration for vim and tmux's clipboard
Plug 'ozars/vim-tmux-clipboard'

" Zoom in/out of windows (toggle between one window and multi-window)
Plug 'regedarek/ZoomWin'

" Unobtrusive scratch window.
Plug 'mtth/scratch.vim'

" Toggle locationlist/quickfix
Plug 'Valloric/ListToggle'

" Misc autoload scripts
Plug 'xolox/vim-misc', { 'for': 'vim' }

" Reload vim scripts (Depends on vim-misc)
Plug 'xolox/vim-reload', { 'for': 'vim' }

" Vim configuration for Rust.
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" No-BS Python code folding for Vim
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }

" Vim omni-completion support for pug (formerly jade) template engine
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }

" Plugin to move lines and selections up and down
Plug 'matze/vim-move'

" unimpaired.vim: Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Text outlining and task management for Vim based on Emacs' Org-Mode
Plug 'jceb/vim-orgmode'

" A Mercurial wrapper for Vim
Plug 'ludovicchabant/vim-lawrencium'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" Extra syntax and highlight for nerdtree files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

call plug#end()
