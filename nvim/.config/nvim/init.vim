set exrc
set relativenumber
set nohlsearch
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set noerrorbells
set incsearch
set expandtab


" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'tpope/vim-fugitive'
call plug#end()

" Fuzzy finder search
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-f> :Rg<CR>
autocmd vimenter * ++nested colorscheme gruvbox

" COC shortkeys
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Vim vue
let g:vim_vue_plugin_load_full_syntax = 1

" Setting tabs to 2 for javascript/html/css files
autocmd BufRead,BufNewFile *.js,*.ts,*.vue,*.css,*.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
