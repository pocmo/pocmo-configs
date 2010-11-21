" Tabs, Spaces and Indentation
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" GUI
set t_Co=256
colorscheme mustang
syntax enable
filetype indent on
set number
set foldmethod=syntax
set foldlevelstart=99

" Do not create annoying temp files
set nobackup
set nowb
set noswapfile

" Shut the F*** up
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Delete trailing white space in PHP files
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.php :call DeleteTrailingWS()

" Highlight trailing whitespaces
highlight TrailingWhitespace ctermbg=darkred ctermfg=white guibg=#990000
match TrailingWhitespace / \+$/

" Highlight characters after the 80 characters per line limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

