-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- packer manages plugins of Neovim

return require('packer').startup(function(use)
      use('wbthomason/packer.nvim')

      --color scheme
      use { 'svrana/neosolarized.nvim',
          requires = { 'tjdevries/colorbuddy.nvim' }
      }
      use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
      use('nvim-treesitter/playground')

      use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          requires = {
              -- LSP Support
              { 'neovim/nvim-lspconfig' }, -- Required
              { 'williamboman/mason.nvim' }, -- Optional
              { 'williamboman/mason-lspconfig.nvim' }, -- Optional

              -- Autocompletion
              { 'hrsh7th/nvim-cmp' }, -- Required
              { 'hrsh7th/cmp-nvim-lsp' }, -- Required
              { 'hrsh7th/cmp-buffer' }, -- Optional
              { 'hrsh7th/cmp-path' }, -- Optional
              { 'saadparwaiz1/cmp_luasnip' }, -- Optional
              { 'hrsh7th/cmp-nvim-lua' }, -- Optional

              -- Snippet;f
              { 'L3MON4D3/LuaSnip' }, -- Required
              { 'rafamadriz/friendly-snippets' }, -- Optional
          }
      }

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

      use {
          "nvim-neo-tree/neo-tree.nvim",
          branch = "v2.x",
          requires = {
              "nvim-lua/plenary.nvim",
              "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
              "MunifTanjim/nui.nvim",
          }
      }
      use {
          'phaazon/hop.nvim',
          branch = 'v2', -- optional but strongly recommended
          config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
          end
      }
      use("lukas-reineke/indent-blankline.nvim")
    end)
