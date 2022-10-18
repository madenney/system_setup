syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set scrolloff=10
set noshowmode
set backspace=indent,eol,start
set updatetime=50

" required for vimwiki:
set nocompatible
filetype plugin on
let g:vimwiki_list = [{'path':'~/Documents/vimwiki', 'path_html':'~/Documents/vimwiki/html'}]

call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
call plug#end()

colorscheme gruvbox

let mapleader =  " "

nnoremap <leader>n :NERDTreeFocus<CR>
let g:NERDTreeWinSize=20

"To close nerdtree when vim closes"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Move lines up or down"
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

