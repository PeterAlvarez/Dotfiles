return {

  {
    enabled = true,
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>cn", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        position = "left",
        width = 17,
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      -- nada obligatorio, funciona bien con config por defecto
    end,
  },
  --
  -- desactivando el menu de blinck
  {
    "blinck/cmp",
    enabled = false,
  },
  {
    "blinck.cmp",
    enabled = false,
  },
  {
    "blink.cmp",
    enabled = false,
  },
  {
    "blink/blink.cmp",
    enabled = false,
  },
}
