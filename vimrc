" Set script encoding
scriptencoding utf-8

" Set character encoding used inside VIM
set encoding=utf-8

" Break compatibility with vi
set nocompatible

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
set textwidth=80   " Break lines at just under 80 characters
set colorcolumn=+1 " Highlight the column after `textwidth`

" Whitespace appearance
set listchars=tab:▸\ ,trail:• " Highlight tabs and trailing spaces
set list                      " Make whitespace characters visible
set diffopt+=vertical,        " Change diff windows property

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
" j Where it makes sense, remove a comment leader when joining lines.
set formatoptions=cqrnj1

"==============================================================================
" Colors
"==============================================================================

syntax enable
set background=dark
let g:solarized_italic=1
let g:solarized_bold=1
let g:solarized_underline=1
colorscheme solarized
highlight SignColumn ctermbg=8

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
nnoremap <F3> :let @/ = '\V' . escape(@", '\\')<CR>
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

autocmd BufNewfile,BufRead vimrc set filetype=vim
autocmd BufNewfile,BufRead zshrc set filetype=zsh
autocmd BufNewfile,BufRead .envrc,envrc,bashrc set filetype=bash
autocmd BufNewfile,BufRead tmux.conf set filetype=tmux
autocmd BufNewfile,BufRead *.jsm set filetype=javascript
autocmd BufRead,BufNewFile *.sbt,*.sc set filetype=scala

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
nmap <Leader>bq :bp <Bar> bd! #<CR>
" List buffers
nmap <Leader>bl :ls<CR>
" Switch to last buffer
nmap <Leader>bb :b#<CR>
" List buffers and ask for the one to switch
nmap <Leader>bg :buffers<CR>:b<Space>

" wrap :cnext/:cprevious and :lnext/:lprevious
function! WrapCommand(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction
nmap <silent> <Leader>q :call WrapCommand("up", "l")<CR>
nmap <silent> <Leader>w :call WrapCommand("down", "l")<CR>
let g:lt_location_list_toggle_map = '<leader>r'
let g:lt_quickfix_list_toggle_map = '<nop>'

" Window navigation
if !exists("g:loaded_tmux_navigator")
  noremap <C-j> <C-w><C-j>
  noremap <C-k> <C-w><C-k>
  noremap <C-l> <C-w><C-l>
  noremap <C-h> <C-w><C-h>
endif
imap <C-j> <C-c><C-j>a
imap <C-k> <C-c><C-k>a
imap <C-l> <C-c><C-l>a
imap <C-h> <C-c><C-h>a

" Close preview/scratch windows
nnoremap <Leader>z <C-w>z

" Paste
noremap <F2> :set invpaste paste?<CR>
inoremap <F2> <C-c>:set invpaste paste?<CR>a
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

" "Zoom" a split window into a tab and/or close it
nmap <Leader><Leader>zo :tabnew %<CR>
nmap <Leader><Leader>zc :tabclose<CR>

"==============================================================================
" Plugin configurations
"==============================================================================

"------------------------------------------------------------------------------
" coc
"------------------------------------------------------------------------------

let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-highlight',
\ 'coc-java',
\ 'coc-metals',
\ 'coc-clangd',
\ 'coc-python',
\ 'coc-rls'
\ ]

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><down> pumvisible() ? "\<C-n>" : "\<down>"
inoremap <expr><up> pumvisible() ? "\<C-p>": "\<up>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" To make <cr> select the first completion item and confirm the completion when
" no item has been selected
noremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <Leader>K to either doHover or show documentation in preview window
nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of current line
xmap <leader>a  <Plug>(coc-codeaction-line)
nmap <leader>a  <Plug>(coc-codeaction-line)

" Fix autofix problem of current line
nmap <leader>qf  :CocFix<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

nmap <F6> :Format<cr>
vmap <F6> <Plug>(coc-format-selected)

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nmap <Leader>nm :NERDTreeFind<CR>

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
    \   'linter_checking': 'LightlineLinterChecking',
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors',
    \   'linter_ok': 'LightlineLinterOkay',
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

function! LightlineLinterChecking()
  return ''
  " return lightline#coc#checking()
endfunction

function! LightlineLinterWarnings()
  return lightline#coc#warnings()
endfunction

function! LightlineLinterErrors()
  return lightline#coc#errors()
endfunction

function! LightlineLinterOkay()
  return lightline#coc#ok()
endfunction

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
" lightline-bufferline
"------------------------------------------------------------------------------

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

"------------------------------------------------------------------------------
" vim-devicons
"------------------------------------------------------------------------------

" Fix issue: https://github.com/ryanoasis/vim-devicons/issues/248
" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:NERDTreeDirArrowExpandable            = "\u00a0"
let g:NERDTreeDirArrowCollapsible           = "\u00a0"
highlight! link NERDTreeFlags NERDTreeDir

" Fix issue: https://github.com/ryanoasis/vim-devicons/issues/154
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

"------------------------------------------------------------------------------
" undotree
"------------------------------------------------------------------------------

" Diff in the bottom, undotree on the left
let g:undotree_WindowLayout = 2

nmap <F4> :UndotreeToggle<CR>

"------------------------------------------------------------------------------
" fzf
"------------------------------------------------------------------------------

nmap <c-p> :FZF<CR>
nmap <c-u> :Ag<CR>
nmap <c-g> :Lines<CR>
nmap <c-b> :Buffers<CR>
" When fzf starts in a terminal buffer, hide the statusline of the containing
" buffer.
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"------------------------------------------------------------------------------
" tagbar
"------------------------------------------------------------------------------

nmap <F8> :TagbarToggle<CR>

"------------------------------------------------------------------------------
" fugitive
"------------------------------------------------------------------------------

nnoremap <F9> :Gstatus<CR>
inoremap <F9> <C-c>:Gstatus<CR>

"------------------------------------------------------------------------------
" vim-clang-format
"------------------------------------------------------------------------------

let g:clang_format#command = 'clang-format-9'

"------------------------------------------------------------------------------
" vim-move
"------------------------------------------------------------------------------

" Do not create default mappings
let g:move_map_keys = 0

vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
vmap <C-h> <Plug>MoveBlockLeft
vmap <C-l> <Plug>MoveBlockRight

"------------------------------------------------------------------------------
" rust.vim
"------------------------------------------------------------------------------

let g:rustfmt_command = "rustfmt +nightly"

"------------------------------------------------------------------------------
" Scratch
"------------------------------------------------------------------------------

nmap <F7> :Scratch<CR>
vmap <F7> :ScratchSelection<CR>
vmap <Leader><F7> :ScratchSelection!<CR>

"------------------------------------------------------------------------------
" gitgutter
"------------------------------------------------------------------------------

let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'

highlight GitGutterAdd ctermfg=22 guifg=#006000 ctermbg=NONE guibg=NONE
highlight GitGutterChange ctermfg=58 guifg=#5F6000 ctermbg=NONE guibg=NONE
highlight GitGutterDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
highlight GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
