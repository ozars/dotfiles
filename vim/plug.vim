call plug#begin('~/.vim/plugged')

" Themes
Plug 'altercation/vim-colors-solarized'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'

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

" Asynchronous linting/fixing for Vim and Language Server Protocol integration
Plug 'w0rp/ale'

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" Show buffers on lightline (depends lightline)
Plug 'mengelbrecht/lightline-bufferline'

" ALE indicator for the lightline vim plugin (depends ligtline, ale)
Plug 'maximbaz/lightline-ale'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" No-BS Python code folding for Vim
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }

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
Plug 'tmux-plugins/vim-tmux-focus-events'

" Seamless integration for vim and tmux's clipboard
Plug 'roxma/vim-tmux-clipboard'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

call plug#end()
