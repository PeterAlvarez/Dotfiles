return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {

      { "K", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "J", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        -- Habilitar la transparencia
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        -- Puedes usar 'transparent' aquí, si el tema lo soporta.
        -- O, más comúnmente, modificar los colores de fondo.
      },
      highlights = {
        -- La clave es sobrescribir los grupos de resaltado existentes.
        -- BufferLineFill = {
        --   bg = "None",
        -- },
        buffer_selected = {
          bg = "NONE",
          fg = "#d79921", -- Color de texto para la pestaña activa
          bold = true,
        },
      },
    },
    -- Mapea la función ToggleBufferline a un atajo (ej. <leader>b)
    vim.api.nvim_set_keymap("n", "<leader>r", ":lua ToggleBufferline()<CR>", { noremap = true, silent = true }),
    -- opts = {
    --   options = {
    --     mode = "tabs",
    --     -- separator_style = "slant",
    --     show_buffer_close_icons = false,
    --     show_close_icon = false,
    --   },
    -- },
  },

  --lualine
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     options = {
  --       -- globalstatus = false,
  --       -- theme = "solarized_dark",
  --     },
  --   },
  -- },
}
