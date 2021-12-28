set exrc
set relativenumber
set nohlsearch
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
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

" Plugins
call plug#begin('~/.vim/plugged')

" Well.. we know what this is.
Plug 'morhetz/gruvbox'

" Bar at the bottom
Plug 'vim-airline/vim-airline'

" LSP 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

" Show changes in sidebar (git based)
Plug 'airblade/vim-gitgutter'

" Formatting for vue
Plug 'posva/vim-vue'

" Git for vim
Plug 'tpope/vim-fugitive'

" Adding anything around text
Plug 'tpope/vim-surround'

" Put stuff in comments
Plug 'tpope/vim-commentary'

" FZF (replacing Telescope for now)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Harpoon
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

call plug#end()

" Define leader
let mapleader = " "

" Highlight whatever was copied
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END

" Indent file
nmap <leader>r gg=G

" Yank till end of file
nnoremap Y y$

" FZF settings
nnoremap <leader>p :GFiles<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fw :Rg <C-R><C-w><CR>
nnoremap <leader>ff :call fzf#vim#gitfiles('', {'options':'--query '.expand('<cWORD>')})<CR>

" LSP shortcuts
nnoremap <leader>gd :lua vim.lsp.buf.definition()<cr>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>gr :lua vim.lsp.buf.rename()<cr>

let $FZF_DEFAULT_COMMAND = 'rg -g ""'

" Vim vue
let g:vue_pre_processors = []

" Setting tabs to 2 for javascript/html/css files
autocmd BufRead,BufNewFile *.js,*.ts,*.vue,*.css,*.html setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Automatically remove trailing spaces
autocmd BufWritePre *.js,*.ts,*.vue,*.css,*.html,*.py,*.txt %s/\s\+$//e

" Center next instances when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Move text up or down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Harpoon settings
nnoremap <C-a> :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-;> :lua require("harpoon.ui").nav_file(4)<CR>


" LSP languages setup and remap for file search
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.vuels.setup{}
EOF

" Nvim cmp setup
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['vuels'].setup {
    capabilities = capabilities
  }
EOF
