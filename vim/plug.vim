call plug#begin('~/.vim/plugged')

" Themes
Plug 'altercation/vim-colors-solarized'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Fuzzy file opener
" Plug 'ctrlpvim/ctrlp.vim'

" Things you can do with fzf and vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" The fancy start screen for Vim
Plug 'mhinz/vim-startify'

" Open from quick-fix-list in new split
Plug 'yssl/QFEnter'

" Respect .editorconfig files. (http://editorconfig.org/)
Plug 'editorconfig/editorconfig-vim'

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

if g:my_completion_engine == "ale" || g:my_linting_engine == "ale"
  " Asynchronous linting/fixing and Language Server Protocol integration
  Plug 'w0rp/ale'

  if g:my_linting_engine == "ale"
    " ALE indicator for the lightline plugin
    Plug 'maximbaz/lightline-ale'
  endif
endif

if g:my_completion_engine == "ycm" || g:my_linting_engine == "ycm"
  " A code-completion engine for Vim
  Plug 'Valloric/YouCompleteMe'

  if g:my_linting_engine == "ycm"
    " YCM indicator for the lightline plugin
    Plug 'ozars/lightline-ycm'

    " Generates config files for YouCompleteMe
    Plug 'ozars/YCM-Generator', { 'branch': 'stable'}
  endif
endif

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Vim syntax highlighting rules for modern CMake
Plug 'pboettch/vim-cmake-syntax'

" No-BS Python code folding for Vim
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }

" Python syntax highlighting for Vim
Plug 'vim-python/python-syntax'

" Remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-repeat'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

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

" Venu, a menu plugin
Plug 'ozars/vim-venu'

" Translation files plugin
Plug 'ozars/po.vim', { 'for': 'po' }

" Misc autoload scripts
Plug 'xolox/vim-misc', { 'for': 'vim' }

" Reload vim scripts (Depends on vim-misc)
Plug 'xolox/vim-reload', { 'for': 'vim' }

" Web IDL (widl) syntax highlighting for vim
Plug 'aldafu/vim-widl'

" Plugin to move lines and selections up and down
Plug 'matze/vim-move'

" Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript,
" TypeScript and ProtoBuf.
Plug 'rhysd/vim-clang-format'

" A formatter for Python files
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

" unimpaired.vim: Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Text outlining and task management for Vim based on Emacs' Org-Mode
Plug 'jceb/vim-orgmode'

" Vim configuration for Rust.
Plug 'rust-lang/rust.vim'

" A Mercurial wrapper for Vim
Plug 'ludovicchabant/vim-lawrencium'

" Cython syntax
Plug 'anntzer/vim-cython'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" Extra syntax and highlight for nerdtree files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Vim omni-completion support for pug (formerly jade) template engine
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

" Use coc for scala
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['scala']}

call plug#end()
