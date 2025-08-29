return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim", -- 👈 aquí el plugin para iconos
  },
  enabled = true,
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets/vscode" })
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/lua" })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-c>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort() -- Cierra el menú
          else
            fallback() -- Si no hay menú, actúa como Ctrl-C normal
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          side_padding = 1,
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          side_padding = 3,
        }),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text", -- "text", "symbol", "symbol_text"
          maxwidth = 50, -- Trunca el texto largo
          ellipsis_char = "...", -- Muestra "..." al truncar
        }),
      },
    })
  end,
}
