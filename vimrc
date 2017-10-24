" Add Pathogen support
execute pathogen#infect()

set nu
syntax on
filetype plugin on

" Don't expand tabs in Makefiles
autocmd Filetype make set noexpandtab

" Enable cindent for C/H files
autocmd Filetype c set cindent
autocmd Filetype h set cindent

" Enable smart indent
set autoindent
set smartindent

" Set vertical moving to allow some lines above/below cursor
set so=10

" Make commandline smarter
set wildmenu
set wildmode=list:longest,full

" Ignore a bunch of filetypes to speed up searches
set wildignore+=*.o,*.d,*.exe,*.a,*.unstripped,*.so,*.swp,cscope.files,cscope.in.out,cscope.out,cscope.po.out
 
" Highlight search results
set hlsearch
 
" Incremental search
set incsearch
 
" Allow files to override modes
set modeline
 
" Easy to look at colour
colorscheme molokai
 
if has("gui_running")
    " remove all GUI elements
    set guioptions=
 
    " set the font
    set guifont=Monospace\ 8
 
    " set window to full screen
    set lines=999 columns=999
endif
 
" Show line numbers
set number
 
" Enable mouse
if has('mouse')
  set mouse=a
  set mousemodel=popup_setpos
endif
 
" Open new vsplits on the right
set splitright
 
" Toggles nerdtree
noremap tt :NERDTreeToggle<CR>
 
" Set NERDTree width
let g:NERDTreeWinSize = 50
 
" Don't open folds when searching
set fdo-=search
 
" Insert todo line
function InsertTodo()
  let res = "//TODO "
  let res .= $USER
  let res .= "@"
  let res .= hostname()
  let res .= " "
  let res .= strftime("%d%m%y")
  let res .= ": "
  exe "normal a".res
  redraw!
endfunction
imap <silent> <F5> <C-O>:call InsertTodo()<CR>
map <silent> <F5> :call InsertTodo()<CR>i
 
" Rebuild cscope DB
nmap <silent> <F12> :!scope<CR>:cs reset<CR><CR>
 
" ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/]\.git$'
 
" Display current function
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
  endfun
map f :call ShowFuncName() <CR>
