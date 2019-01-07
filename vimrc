" Includes some config from captbaritone/dotfiles

" Set script encoding
scriptencoding utf-8

" Set character encoding used inside VIM
set encoding=utf-8

" Break compatibility with vi
set nocompatible

" Should be ale or ycm
let g:my_completion_engine = 'ycm'

"==============================================================================
" Use Plug for loading plugins
"==============================================================================
source $HOME/.vim/plug.vim

"==============================================================================
" General options
"==============================================================================
set hidden                     " Allow hidden buffers
set showcmd                    " Show commands in status bar
set wildmenu                   " Command completion
set wildmode=list:longest      " List all matches and complete till longest
                               " common substring
set noshowmode                 " Don't show the mode in the last line of the
                               " screen, lightline takes care of it
set showtabline=2              " Always show tab line (for lightline)
set laststatus=2               " Always show status line (for lightline)
set ruler                      " Show the line and column number of the cursor
                               " position separated by a comma
set lazyredraw                 " Don't update the screen while executing
                               " macros/commands
set number                     " Show line numbers
set nofoldenable               " Disable folding in the beginning
set ttimeoutlen=10             " Reduce timeout before mapped key codes
                               " so that delay in  mode change in status line
                               " is avoided.
set backspace=indent,eol,start " Allow basckspace on indentation

" Buffer area visuals
set scrolloff=5    " Min number of lines to keep above and below the cursor.
set visualbell     " Use a visual bell, don't beep!
set textwidth=79   " Break lines at just under 80 characters
set colorcolumn=+1 " Highlight the column after `textwidth`

" Whitespace appearance
set listchars=tab:▸\ ,trail:• " Highlight tabs and trailing spaces
set list                      " Make whitespace characters visible

"==============================================================================
" Character meaning when present in 'formatoptions'
"==============================================================================
" c Auto-wrap comments using textwidth, inserting the current comment leader
"   automatically.
" q Allow formatting of comments with "gq".
" r Automatically insert the current comment leader after hitting <Enter> in
"   Insert mode.
" t Auto-wrap text using textwidth (does not apply to comments)
" n Recognize numbered lists
" 1 Don't break line after one-letter words
" a Automatically format paragraphs
set formatoptions=cqrn1

"==============================================================================
" Colors
"==============================================================================
syntax enable
set background=dark
colorscheme solarized

"==============================================================================
" Searching
"==============================================================================
set incsearch " Show search results as we type
set showmatch " Show matching brackets
set hlsearch  " Highlight search results

" Use regex for searches
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
set ignorecase " Ignore case when searching
set smartcase  " Don't ignore case if there is a capital letter

"==============================================================================
" Indentation
"==============================================================================
set tabstop=4             " Show a tab as four spaces
set shiftwidth=4          " Reindent is also four spaces
set softtabstop=4         " When hit <tab> use four columns
set expandtab             " Create spaces when I type <tab>
set shiftround            " Round indent to multiple of 'shiftwidth'.
set autoindent            " Automatically indent on new line
filetype plugin indent on " Rely on file plugins to handle indenting

"==============================================================================
" Custom filetypes
"==============================================================================

" TODO: Define bashrc, zshrc etc.

"==============================================================================
" Custom mappings
"==============================================================================

" Edit rc files
nmap <silent> <Leader>ev :split $MYVIMRC<CR>
nmap <silent> <Leader>ez :split $HOME/.zshrc<CR>
nmap <silent> <Leader>ep :split $HOME/.vim/plug.vim<CR>
nmap <silent> <Leader>es :split $HOME/.ssh/config<CR>
nmap <silent> <Leader>et :split $HOME/.tmux.conf<CR>
nmap <silent> <Leader>sv :source $MYVIMRC<CR>
nmap <silent> <Leader>sp :source $HOME/.vim/plug.vim<CR>

" Turn off search highlight
nnoremap <Leader><Space> :nohlsearch<CR>

" Corrections common quit typos
command! W w
command! Q q
command! WQ wq
command! Wq wq
command! Wa wa
command! Qa qa
command! WQA wqa
command! WQa wqa

" Buffer navigation
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>
" Quit and delete buffer
nmap <Leader>bq :bp <Bar> bd #<CR>
" List buffers
nmap <Leader>bl :ls<CR>
" Switch to last buffer
nmap <Leader>bb :b#<CR>
" List buffers and ask for the one to switch
nmap <Leader>bg :buffers<CR>:b<Space>

" Window navigation
if !exists("g:loaded_tmux_navigator")
  noremap <C-j> <C-w><C-j>
  noremap <C-k> <C-w><C-k>
  noremap <C-l> <C-w><C-l>
  noremap <C-h> <C-w><C-h>
endif
imap <C-j> <Esc><C-j>
imap <C-k> <Esc><C-k>
imap <C-l> <Esc><C-l>
imap <C-h> <Esc><C-h>

" Close preview/scratch windows
nnoremap <Leader>z <C-w>z

" Paste
noremap <F2> :set invpaste paste?<CR>
inoremap <F2> <Esc>:set invpaste paste?<CR>i<CR>
set pastetoggle=<F2>

" Copy and paste bindings
if has('clipboard') && !has('gui_running')
  vnoremap <C-c> "+y
  vnoremap <C-x> "+d
  vnoremap <C-v> "+gP
  nnoremap <C-c> "+y
  nnoremap <C-x> "+d
  nnoremap <C-v> "+gP
endif

" Highlight last inserted text
nnoremap gV `[v`]

" Reselect visual selection after manual indentation
vmap > >gv
vmap < <gv

" Turn off Ex mode
map Q <NOP>

" Turn off accidental quits
map ZZ <NOP>
map ZQ <NOP>

" Use Z to Zelete, deleting without copying
nnoremap Z "_d
nmap ZZ Zd
nmap Q "_x

"==============================================================================
" Plugin configurations
"==============================================================================

"------------------------------------------------------------------------------
" ale
"------------------------------------------------------------------------------

highlight SignColumn ctermbg=0/4
highlight ALEErrorSign cterm=bold ctermfg=160 ctermbg=0/4
highlight ALEWarningSign cterm=bold ctermfg=136 ctermbg=0/4
let g:ale_sign_error   = "\u2622"
let g:ale_sign_warning = "\u2623"
let g:ale_open_list = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Use YCM for completion instead
if g:my_completion_engine == 'ale'
  let g:ale_completion_enabled = 1
else
  let g:ale_completion_enabled = 0
endif

" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1

" When to run linters
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1

" Goto next/previous error
nmap <silent> <Leader>q <Plug>(ale_previous_wrap)
nmap <silent> <Leader>w <Plug>(ale_next_wrap)

" Temporarily disable white space trimming, since it removes spaces
" unnecessarily while linting/fixing
augroup ALEProgress
    autocmd!
    autocmd User ALELintPre  call lessspace#TemporaryDisableBegin()
    autocmd User ALELintPost call lessspace#TemporaryDisableEnd()
    autocmd User ALEFixPre   call lessspace#TemporaryDisableBegin()
    autocmd User ALEFixPost  call lessspace#TemporaryDisableEnd()
augroup END

"------------------------------------------------------------------------------
" YouCompleteMe
"------------------------------------------------------------------------------

let g:ycm_python_interpreter_path = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_disable_for_files_larger_than_kb = 100
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_complete_in_comments = 0
let g:ycm_add_preview_to_completeopt = 1

"------------------------------------------------------------------------------
" NERDCommenter
"------------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------

nmap <Leader>nn :NERDTreeFocus<CR>

"------------------------------------------------------------------------------
" lightline
"------------------------------------------------------------------------------

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ 'active': {
    \   'left': [['mode', 'paste'], ['fugitive'], ['filename', 'ctrlpmark']],
    \   'right': [
    \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
    \     ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']
    \   ]
    \ },
    \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \   'mode': 'LightlineMode',
    \   'ctrlpmark': 'CtrlPMark',
    \ },
    \ 'component_expand': {
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \   'buffers': 'lightline#bufferline#buffers',
    \ },
    \ 'component_type': {
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left',
    \   'buffers': 'tabsel',
    \ },
    \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? ' ' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ?
    \ g:lightline.ctrlp_item :
    \ fname == '__Tagbar__' ? g:lightline.fname :
    \ fname =~ '__Gundo\|NERD_tree' ? '' :
    \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
    \ &ft == 'unite' ? unite#get_status_string() :
    \ &ft == 'vimshell' ? vimshell#get_status_string() :
    \ LightlineReadonly() .
    \ ('' != fname ? fname : '*')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ' '
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
    \ fname == 'ControlP' ? 'CtrlP' :
    \ fname == '__Gundo__' ? 'Gundo' :
    \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
    \ fname =~ 'NERD_tree' ? 'NERDTree' :
    \ &ft == 'unite' ? 'Unite' :
    \ &ft == 'vimfiler' ? 'VimFiler' :
    \ &ft == 'vimshell' ? 'VimShell' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
  call lightline#link('iR'[g:lightline.ctrlp_regex])
  return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
      \ , g:lightline.ctrlp_next], 0)
  else
  return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline    = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"------------------------------------------------------------------------------
" lightline-ale
"------------------------------------------------------------------------------

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors   = "\uf05e"
let g:lightline#ale#indicator_ok       = "\uf00c"

"------------------------------------------------------------------------------
" lightline-bufferline
"------------------------------------------------------------------------------

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

"------------------------------------------------------------------------------
" vim-devicons
"------------------------------------------------------------------------------

" Fix issue: https://github.com/ryanoasis/vim-devicons/issues/248
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:NERDTreeDirArrowExpandable            = "\u00a0"
let g:NERDTreeDirArrowCollapsible           = "\u00a0"
highlight! link NERDTreeFlags NERDTreeDir

"------------------------------------------------------------------------------
" undotree
"------------------------------------------------------------------------------

" Diff in the bottom, undotree on the left
let g:undotree_WindowLayout = 2

nmap <F4> :UndotreeToggle<CR>

"------------------------------------------------------------------------------
" vim-easy-align
"------------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Align around assignment operators
xmap <Leader>a= <Plug>(EasyAlign)<C-X>[+*/-]\?=<CR>
nmap <Leader>a= <Plug>(EasyAlign)ip<C-X>[+*/-]\?=<CR>
