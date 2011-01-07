" gvimrc

" font
"set guifont=Consolas:h11:cANSI
"set guifontwide=MS_Gothic:h11:cSHIFTJIS
set guifontset=Consolas:h12
set linespace=1

" hide gui menu
set guioptions-=T
set guioptions-=m

" color setting
colorscheme evening 

" StatusLine color Settings (gvim only)
augroup InsertHook
    autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" cursor color change for IME status
if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=Purple guifg=NONE
endif
