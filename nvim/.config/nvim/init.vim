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
set termguicolors
set scrolloff=8
set noerrorbells
set incsearch
set expandtab
set completeopt=menuone,noselect

" Forcing theme
autocmd vimenter * ++nested colorscheme gruvbox

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true


" Plugins
call plug#begin('~/.vim/plugged')

" Well.. we know what this is.
Plug 'morhetz/gruvbox'

" Bar at the bottom
Plug 'vim-airline/vim-airline'

" LSP 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Show changes in sidebar (git based)
Plug 'airblade/vim-gitgutter'

" Formatting for vue
Plug 'leafOfTree/vim-vue-plugin'

" Git for vim
Plug 'tpope/vim-fugitive'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Telescope Fuzzy search
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

" Define leader
let mapleader = " "

" Find files using Telescope command-line sugar.
nnoremap <leader>p <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Vim vue
let g:vim_vue_plugin_load_full_syntax = 1

" Setting tabs to 2 for javascript/html/css files
autocmd BufRead,BufNewFile *.js,*.ts,*.vue,*.css,*.html setlocal tabstop=2 softtabstop=2 shiftwidth=2

" LSP languages setup and remap for file search
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.vuels.setup{}

require('telescope').load_extension('fzf')
EOF
