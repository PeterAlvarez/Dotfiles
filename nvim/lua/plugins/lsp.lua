return {
  -- Plugin principal LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver", -- TypeScript / JavaScript
          "html", -- HTML
          "cssls", -- CSS
          "bashls", -- Bash
          "pyright", -- Python
        },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")

      -- Configuración por servidor
      local servers = {
        tsserver = {},
        html = {},
        cssls = {},
        bashls = {},
        pyright = {},
        emmet_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
      }

      for name, config in pairs(servers) do
        lspconfig[name].setup(config)
      end
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      require("lsp.java") -- Ruta al archivo lua/lsp/java.lua
    end,
  },
}
