-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
      -- packer manages plugins of Neovim
      use('wbthomason/packer.nvim')

      --color scheme
      use { 'svrana/neosolarized.nvim',
          requires = { 'tjdevries/colorbuddy.nvim' }
      }
      use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
      use('nvim-treesitter/playground')

      use('VonHeikemen/lsp-zero.nvim')

      --LSP Support
      use('neovim/nvim-lspconfig') --LSP
      use('williamboman/mason.nvim')
      use('williamboman/mason-lspconfig.nvim')

      -- Autocompletion
      use('hrsh7th/cmp-buffer') -- nvim-cmp source for buffer words
      use('hrsh7th/cmp-nvim-lsp') -- nvim-cmp source for neovim's built-in LSP
      use('hrsh7th/nvim-cmp') -- Completion
      use('hrsh7th/cmp-path')
      use('hrsh7th/cmp-nvim-lua')

      -- snippets
      use('L3MON4D3/LuaSnip')
      use("rafamadriz/friendly-snippets")

      --statusLIne and bufferline
      use('hoob3rt/lualine.nvim')
      use('akinsho/nvim-bufferline.lua')
      use('folke/zen-mode.nvim')

      -- autopairs and icons
      use('windwp/nvim-autopairs')
      use('windwp/nvim-ts-autotag')
      use('kyazdani42/nvim-web-devicons')

      --Code Formattier
      use('jose-elias-alvarez/null-ls.nvim') --use neovim as a language server to inject LSP diagnostics,code actions
      use('MunifTanjim/prettier.nvim') --Prettier plugin for Neovim's builting


      --find file telescope
      use('nvim-telescope/telescope.nvim')
      use('nvim-telescope/telescope-file-browser.nvim')


      --GitHub
      use('tpope/vim-fugitive')
      use('lewis6991/gitsigns.nvim')


      use('onsails/lspkind-nvim') --vscode-like pictograms
      use('nvim-lua/plenary.nvim') -- Common utilities
      use('glepnir/lspsaga.nvim') -- LSP UIs
    end)
