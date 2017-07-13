set nocompatible
set number
filetype off
syntax on

" search
set incsearch
set hlsearch

" register
set ignorecase
set smartcase

" colorscheme
set t_Co=256
colorscheme gruvbox
set background=dark

" cursor
set ruler
set cursorline
hi CursorLine ctermbg=237

" tabulation
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set smarttab

" buffers
set hidden

" indent
set autoindent
set smartindent


" windows
nmap <C-l> :wincmd l<cr>
nmap <C-h> :wincmd h<cr>
nmap <C-k> :wincmd k<cr>
nmap <C-j> :wincmd j<cr>

" tabs
nmap <A-l> :bn<cr>
nmap <A-h> :bp<cr>
nmap <A-q> :bp <bar> bw #<cr>


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'

Plugin 'VundleVim/Vundle.vim'

" git
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'



" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" IDE features
" nerd tree
Plugin 'scrooloose/nerdtree.git'

" nerd commenter
Plugin 'scrooloose/nerdcommenter'

" auto-pairs
Plugin 'jiangmiao/auto-pairs'

" vimproc some fucking plugin required for good typescript support
Plugin 'Shougo/vimproc.vim', {'do' : 'make'}


" typescript syntax
Plugin 'leafgarland/typescript-vim'

" component templates syntax highlighting
Plugin 'Quramy/vim-js-pretty-template'

" typescript ide mother fucker
Plugin 'Quramy/tsuquyomi'

call vundle#end()
filetype plugin indent on


" Nerd tree
autocmd vimenter * NERDTree
nmap <silent> <special> <F2> :NERDTreeToggle<RETURN>

" Nerd commenter
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='gruvbox'

" typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" component templates syntax highlighting
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces


" Scripts
" Map alt escapes to it'l <A-*> analogs
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Highlight word under cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
