set nocompatible
" Automatically save the file before doing a make
set autowrite

set bs=2

" Handle indentation like a pro (use ^T/^D for indent/dedent)
set autoindent
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround

set novisualbell

" Don't wrap code in small windows (usually I don't like that)
set nowrap

" Turn on some superpowers for searching and completion
set wildmenu
set hlsearch showmatch

" Turn on the man pages, accessible as ":Man something"
runtime ftplugin/man.vim

" turn on syntax highlighting
syntax enable
filetype plugin indent on

" When searching, ignore case unless the pattern has a capital
set ignorecase
set smartcase

" make vim more verbose
set showmode showcmd

set ruler
" Set 256 colorscheme if we can
if $TERM =~ "256color" || has('gui_running')
  colorscheme xoria256
else
  colorscheme darkdot
endif

set nowb
set nu

set laststatus=2

set listchars=tab:>-,trail:.,extends:#
set list

if v:version >= 700
  set completeopt-=menu
endif

" AutoCommands
if has('autocmd')
  autocmd BufRead * call SetStatusLine()

  if has('unix')
    autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
  elseif has('windows')
    autocmd BufNewFile * silent! 0r $HOME/vimfiles/templates/%:e.tpl
  endif
end

" Fast split movement
nmap <C-j> <c-w>j
nmap <C-k> <c-w>k
nmap <C-h> <c-w>h
nmap <C-l> <c-w>l

" Set the status line
function! SetStatusLine()
  let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
  let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
  let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
  execute "set statusline=" . l:s1 . l:s2 . l:s3
endfunction

" TOhtml settings
let html_number_lines = 0
let use_xhtml = 1
let html_use_css = 1

" Settings for VimClojure
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

" Settings for Java
let java_highlight_all = 1
let java_hightlight_debug = 1
let java_highlight_java_lang_ids = 1
let java_hightlight_functions = "style"
