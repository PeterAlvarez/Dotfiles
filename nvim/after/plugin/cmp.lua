local status, cmp = pcall(require, "cmp")
local luasnip = require('luasnip')
local lspkind = require('lspkind')

luasnip.config.set_config({
    region_check_events = 'InsertEnter',
    delete_check_events = 'InsertLeave',
    enable_autosnippets = true,
})

if (not status) then return end

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.confirm({ select = false }),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-l>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c', 's' }),
            ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's', 'n' }),
            ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's', 'n' }),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'buffer',   keyword_length = 3 },
        { name = 'luasnip',  keyword_length = 2 },
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


require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })
require("luasnip/loaders/from_vscode").load({ include = { "javascript", "javascriptreact" } })
require("luasnip/loaders/from_vscode").lazy_load()

luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("html", { "css" })



vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
