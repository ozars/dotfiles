" Includes some config from captbaritone/dotfiles

" Set script encoding
scriptencoding utf-8

" Set character encoding used inside VIM
set encoding=utf-8

" Break compatibility with vi
set nocompatible

" Should be ale or ycm
let g:my_completion_engine = 'ycm'
let g:my_linting_engine = 'ycm'

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
set formatoptions=cqrtnj1

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
" Custom functions/commands
"==============================================================================

function! s:FormatCode(line1, line2)
  exe "normal i\<C-G>u\<Esc>"
  if &filetype == "rust"
    try
      execute a:line1 . "," . a:line2 . "RustFmtRange"
    catch
      RustFmt
    endtry
  elseif &filetype == "python"
    execute a:line1 . "," . a:line2 . "YAPF"
  else
    execute a:line1 . "," . a:line2 . "ClangFormat"
  endif
endfunction

command! -range=% FormatCode call s:FormatCode(<line1>, <line2>)

nmap <F6> :FormatCode<cr>
vmap <F6> :'<,'>FormatCode<cr>

"==============================================================================
" Plugin configurations
"==============================================================================

"------------------------------------------------------------------------------
" ale
"------------------------------------------------------------------------------

if g:my_completion_engine != 'ale' && g:my_linting_engine != 'ale'
  let g:ale_enabled = 0
else
  if g:my_completion_engine != 'ale'
    let g:ale_completion_enabled = 0
  else
    let g:ale_completion_enabled = 1
  endif

  if g:my_linting_engine != 'ale'
    let b:ale_linters = []
    let g:ale_linters = {}
  else
    " Sign column styles
    highlight SignColumn ctermbg=0/4
    highlight ALEErrorSign cterm=bold ctermfg=160 ctermbg=0/4
    highlight ALEWarningSign cterm=bold ctermfg=136 ctermbg=0/4
    let g:ale_sign_error   = "\u2622"
    let g:ale_sign_warning = "\u2623"

    " Show linting results on a list
    let g:ale_open_list = 1

    " Only run linters named in ale_linters settings.
    let g:ale_linters_explicit = 1

    " Keep the sign gutter open at all times
    let g:ale_sign_column_always = 1

    " When to run linters
    let g:ale_lint_on_text_changed = 0
    let g:ale_lint_on_insert_leave = 1

    " Goto next/previous error
    " nmap <silent> <Leader>q <Plug>(ale_previous_wrap)
    " nmap <silent> <Leader>w <Plug>(ale_next_wrap)

    " Temporarily disable white space trimming, since it removes spaces
    " unnecessarily while linting/fixing
    if exists("loaded_lessspace_plugin") && g:loaded_lessspace_plugin
      augroup ALEProgress
        autocmd!
        autocmd User ALELintPre  call lessspace#TemporaryDisableBegin()
        autocmd User ALELintPost call lessspace#TemporaryDisableEnd()
        autocmd User ALEFixPre   call lessspace#TemporaryDisableBegin()
        autocmd User ALEFixPost  call lessspace#TemporaryDisableEnd()
      augroup END
    else
      augroup ALEProgress
        autocmd!
      augroup END
    endif
  endif
endif

"------------------------------------------------------------------------------
" YouCompleteMe
"------------------------------------------------------------------------------

if g:my_linting_engine == 'ycm' || g:my_completion_engine == 'ycm'

    " Let clangd fully control code completion
    let g:ycm_clangd_uses_ycmd_caching = 0
    " Use installed clangd, not YCM-bundled clangd which doesn't get updates.
    let g:ycm_clangd_binary_path = exepath("clangd-9")

    let g:ycm_python_interpreter_path          = 'python3'
    let g:ycm_global_ycm_extra_conf            = '~/.ycm_extra_conf.py'
    let g:ycm_disable_for_files_larger_than_kb = 100
    let g:ycm_confirm_extra_conf               = 0

    if g:my_linting_engine != 'ycm'
      let g:ycm_show_diagnostics_ui            = 0
      let g:ycm_enable_diagnostic_signs        = 0
      let g:ycm_enable_diagnostic_highlighting = 0
      let g:ycm_echo_current_diagnostic        = 0
    else
      highlight SignColumn ctermbg=0/4
      highlight YcmErrorSign cterm=bold ctermfg=160 ctermbg=0/4
      highlight YcmWarningSign cterm=bold ctermfg=136 ctermbg=0/4
      let g:ycm_error_symbol   = "\u2622"
      let g:ycm_warning_symbol = "\u2623"

      let g:ycm_key_list_select_completion   = ['<Down>']
      let g:ycm_key_list_previous_completion = ['<Up>']

      let g:ycm_collect_identifiers_from_tags_files = 1
      let g:ycm_always_populate_location_list       = 1
    endif

    if g:my_completion_engine == 'ycm'
      let g:ycm_complete_in_comments       = 1
      let g:ycm_add_preview_to_completeopt = 1
      nnoremap <leader>yy :YcmCompleter GetDoc<cr>
      nnoremap <leader>yf :YcmCompleter FixIt<cr>
      nnoremap <leader>yr :YcmCompleter RefactorRename <c-r><c-w>
      nnoremap <leader>jj :YcmCompleter GoTo<cr>
      nnoremap <leader>jk :YcmCompleter GoToImprecise<cr>
      nnoremap <leader>jf :YcmCompleter GoToDefinition<cr>
      nnoremap <leader>jd :YcmCompleter GoToDeclaration<cr>
      nnoremap <leader>ji :YcmCompleter GoToInclude<cr>
    endif
endif

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
  if g:my_linting_engine == 'ale'
    return lightline#ale#checking()
  endif
  if g:my_linting_engine == 'ycm'
    return lightline#ycm#checking()
  endif
  return ''
endfunction

function! LightlineLinterWarnings()
  if g:my_linting_engine == 'ale'
    return lightline#ale#warnings()
  endif
  if g:my_linting_engine == 'ycm'
    return lightline#ycm#warnings()
  endif
  return ''
endfunction

function! LightlineLinterErrors()
  if g:my_linting_engine == 'ale'
      return lightline#ale#errors()
  endif
  if g:my_linting_engine == 'ycm'
    return lightline#ycm#errors()
  endif
  return ''
endfunction

function! LightlineLinterOkay()
  if g:my_linting_engine == 'ale'
      return lightline#ale#ok()
  endif
  if g:my_linting_engine == 'ycm'
    return lightline#ycm#ok()
  endif
  return ''
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
" vim-easy-align
"------------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Align around assignment operators
xmap <Leader>a= <Plug>(EasyAlign)<C-X>[+*/-]\?=<CR>
nmap <Leader>a= <Plug>(EasyAlign)ip<C-X>[+*/-]\?=<CR>

"------------------------------------------------------------------------------
" CtrlP
"------------------------------------------------------------------------------

" let g:ctrlp_extensions = ['line']
" nmap <c-u> :CtrlPLine<CR>

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
" neomake
"------------------------------------------------------------------------------

" nmap <F9> :Neomake<CR>

"------------------------------------------------------------------------------
" Venu
"------------------------------------------------------------------------------

function! MyVenuFilter(key, menu)
  return a:menu.name == 'PO-Editing'
    \ && venu#native#defaultFilter(a:key, a:menu)
endfunction

function! MyStartVenu()
  try
    call venu#clear()
  catch
    try
      call venu#unregisterAll()
      let venu#clear = function('venu#unregisterAll')
    catch
      " do nothing
    endtry
  endtry
  call venu#native#import(function('MyVenuFilter'))
  call venu#defaultStartVenuCallback()
endfunction

let venu_conf = {'StartVenuCallback': function('MyStartVenu')}
nnoremap <Leader>p :call venu#print(venu_conf)<CR>
vnoremap <Leader>p <C-C>:call venu#print(venu_conf)<CR>

"------------------------------------------------------------------------------
" fugitive
"------------------------------------------------------------------------------

nnoremap <F9> :Gstatus<CR>
inoremap <F9> <C-c>:Gstatus<CR>

"------------------------------------------------------------------------------
" gabrielelena/vim-markdown
"------------------------------------------------------------------------------

" Disable mappings
let g:markdown_enable_mappings = 0

" Disable spell check
let g:markdown_enable_spell_checking = 0

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
" python-syntax
"------------------------------------------------------------------------------

let g:python_highlight_all = 1

"------------------------------------------------------------------------------
" rust.vim
"------------------------------------------------------------------------------

let g:rustfmt_command = "rustfmt +nightly"

"------------------------------------------------------------------------------
" Scratch
"------------------------------------------------------------------------------

nmap <f7> :Scratch<CR>
vmap <f7> :ScratchSelection<CR>
vmap <leader><f7> :ScratchSelection!<CR>
