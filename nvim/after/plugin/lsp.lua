local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
    -- 'tsserver',
    -- 'eslint',
    --'sumneko_lua',
    --'lua_ls'
})

lsp.setup_servers({
    'tsserver'
})

lsp.set_preferences({

})


lsp.preset('recommended')

lsp.setup_nvim_cmp({
    formatting = {
        -- changing the order of fields so the icon is the first
        fields = { 'abbr', 'menu', 'kind' },
        -- here is where the change happens
        format = require('lspkind').cmp_format({
            maxwidth = 80,
            before = function(entry, vim_item)
                return vim_item
            end
        })
    },
})

lsp.setup()


-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        --prefix = '●'
        prefix = ''
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})
