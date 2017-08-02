" vimrc (configuration file for vim only)

" enable syntax highlighting
syntax on
set synmaxcol=500

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

" get easier to use and more user friendly vim defaults
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" that it potentially can open for malicious users to do harmful things.
set nomodeline

" autoindent
set autoindent

" The null character is inserted instead of the tab.
set expandtab
set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.md :set filetype=markdown
au BufNewFile,BufRead Dockerfile-* :set filetype=dockerfile
"au BufNewFile,BufRead *.spec.* :set filetype=spec

" When Tab is driven in the blank at the head of line,
" only the number of 'Shiftwidth' does the indent.
set smarttab

" incremental search
set incsearch

" search highlight
set hlsearch

" Highlight of parentheses
set showmatch

" When retrieving it, capital letters and small letters are disregarded.
" (ignorecase -> Disregard ,noignorecase -> NOT Disregard )
set ignorecase

" When the capital letter is included in the retrieval,
" large/smallness is distinguished.
set smartcase

" Advanced automatic indenting
" set smartindent

" StatusLine Settings
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2

" Automatic select encode
set encoding=utf8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
"set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp,cp932

" Special character measures
set ambiwidth=double

" Persistent undo
set undofile
set undodir=~/.vimundo

" StatusLine color Settings
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=white ctermbg=blue cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction

" filetype
filetype on
filetype indent on
filetype plugin on

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" colorscheme
set t_Co=256
colorscheme molokai

" space or line breaks to stand out
set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/

" remove white space at the end-of when you save
"autocmd BufWritePre * :%s/\s\+$//ge
" converting spaces to tab when you save
"autocmd BufWritePre * :%s/\t/  /ge

" Makefile
let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif

" Enable mouse mode
"if has("mouse")
    "set mouse=a
    "set clipboard=unnamed,autoselect
"endif
" Disable mouse mode
set mouse-=a

" Enable mouse mode for screen
" set ttymouse=xterm2
