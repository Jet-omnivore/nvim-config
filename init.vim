call plug#begin('~/NeovimData/Local/nvim/plugged')
    Plug 'preservim/nerdcommenter'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'github/copilot.vim'
    " syntax highlight
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "LSP auto-complete
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path' 
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

lua require('lsp_setup')
lua require('treesitter_setup')

set completeopt-=preview
set background=dark
set noswapfile
set number
set relativenumber
set wildmenu
set clipboard+=unnamedplus
set mouse=
set autoindent smartindent expandtab shiftwidth=2 tabstop=2
" (smart indent) tabs -> spaces
" no of spaces in indentation 
set scrolloff=15
set path+=**
set wildignore+=*/__pycache__/*
filetype plugin indent on
set termguicolors

let g:netrw_banner=0
"italics
let &t_zh="\e[3m"
let &t_zr="\e[23m"

set background=dark
colorscheme gruvbox
"when using gruxbox theme
"highlight clear LineNr

set autowriteall

runtime nerdcommenter-config/config.vim
runtime myconfig/keybindings.vim

let g:copilot_enabled = 0
