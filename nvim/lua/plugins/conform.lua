return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      python = { "black" },
      sh = { "shfmt" },
    },
    formatters = {
      prettier = {
        prepend_args = function()
          local ft = vim.bo.filetype
          if ft == "html" or ft == "json" then
            return { "--tab-width", "2" }
          else
            return { "--tab-width", "4" }
          end
        end,
      },
    },
  },
}

-- -- ~/.config/nvim/lua/plugins/conform.lua
-- return {
--   "stevearc/conform.nvim",
--   event = { "BufWritePre" },
--   config = function()
--     require("conform").setup({
--       format_on_save = {
--         timeout_ms = 1000,
--         lsp_fallback = true,
--       },
--       formatters_by_ft = {
--         javascript = { "prettier" },
--         typescript = { "prettier" },
--         html = { "prettier" },
--         css = { "prettier" },
--         json = { "prettier" },
--         yaml = { "prettier" },
--         markdown = { "prettier" },
--         python = { "black" },
--         sh = { "shfmt" },
--       },
--       formatters = {
--         prettier = {
--           prepend_args = function()
--             local ft = vim.bo.filetype
--             if ft == "html" then
--               return { "--tab-width", "2" }
--             else
--               return { "--tab-width", "4" }
--             end
--           end,
--         },
--       },
--     })
--   end,
-- }
