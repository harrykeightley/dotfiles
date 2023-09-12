if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

lua require("hjk.globals")

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

if has("nvim")
  "Colorschemes
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'rebelot/kanagawa.nvim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'water-sucks/darkrose.nvim'

  Plug 'rose-pine/neovim', {'as': 'rose-pine'}
  Plug 'savq/melange-nvim'
  Plug 'hoob3rt/lualine.nvim'

  Plug 'rktjmp/lush.nvim'

  " Language server management
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'

  " Snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'

  " netrw file tree replacement
  Plug 'nvim-tree/nvim-tree.lua'

  " Smart commenting
  Plug 'numToStr/Comment.nvim'

  Plug 'simrat39/rust-tools.nvim'
  Plug 'lewis6991/gitsigns.nvim'

  " Lispy stuff
  Plug 'Olical/conjure'
  Plug 'guns/vim-sexp'
  Plug 'tpope/vim-sexp-mappings-for-regular-people'

endif

call plug#end()

