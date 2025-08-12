local wk = require("which-key")
local map = vim.keymap.set

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      layout = {
        width = { min = 20 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      win = {
        border = "single", -- none, single, double, shadow
        padding = { 2, 2 }, -- extra window padding [top, right, bottom, left]
        width = 110,
      },
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      preset = "modern",
      icons = {
        breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
        separator = " ", -- symbol used between a key and it's label
        group = " ", -- symbol prepended to a group
      },

      wk.add({
        { ";", group = "Telescope" },
        { "<leader>n", group = "Files" }, -- group
        { "<leader>", group = "Leader" }, -- group
        { "<leader>c", group = "Code" }, -- group
        {
          "<leader>ct",
          "<cmd>lua vim.lsp.buf.hover()<CR>",
          desc = "Code information",
        },

        { "<leader>p", group = "My shorcuts" }, -- group
        {
          "<leader>pf",
          '<cmd>lua ColorMyPencils()<CR>:echo "color function executed!!"<CR>',
          desc = "Color My Pencils",
        },
        {
          "<leader>pa",
          '<cmd>lua TabWidth()<CR>:echo "Formatted config for tab four space!!"<CR>',
          desc = "typescript tab size space",
        },
        {
          "<leader>pe",
          "<cmd>b#<CR>zz",
          desc = "Buff prev",
        },
        {
          "<leader>pw",
          '<cmd>wa<CR>:echo "Save!!"<CR>',
          desc = "Save",
        },

        {
          map("n", "<leader>pt", function()
            Snacks.terminal()
          end, { desc = "Opern Terminal" }),
        },
        {
          map("n", "<leader>pn", function()
            Snacks.notifier.hide()
          end, { desc = "Close notify" }),
        },

        {
          map("n", "<leader>pr", function()
            Snacks.rename.rename_file()
          end, { desc = "Delete buffer" }),
        },
        {
          map("n", "<leader>pc", function()
            Snacks.bufdelete()
          end, { desc = "Delete buffer" }),
        },
        {
          "<leader>pp",
          "<cmd>let @+ = expand('%:p')<CR>:echo 'Copied Path!!'<CR>",
          desc = "Copy path file",
        },
        {
          "<leader>pq",
          ":q<CR>",
          desc = "Close Tab",
        },
      }),
    },
    config = function(_, opts)
      local wky = require("which-key")
      wky.setup(opts)
      -- wk.register(opts.defaults)
    end,
  },
}
