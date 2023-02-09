local status, cmp = pcall(require, "cmp")

if (not status) then return end
local lspkind = require 'lspkind'


cmp.setup({
    snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ['<C-k>'] = cmp.mapping.select_prev_item({
            behavior = cmp.ConfirmBehavior.select
        }),
        ['<C-j>'] = cmp.mapping.select_next_item({
            behavior = cmp.ConfirmBehavior.select
        }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 80,
            before = function(entry, vim_item)
              return vim_item
            end
        })
    }
})




--require("luasnip.loaders.from_vscode").lazy_load()

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
