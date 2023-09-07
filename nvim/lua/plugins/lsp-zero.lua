return {
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-git",
            "saadparwaiz1/cmp_luasnip",
        },

        branch = 'v2.x',
        lazy = true,
        config = function()
            local lsp = require('lsp-zero')

            lsp.preset('recommended')
            lsp.ensure_installed({
                'tsserver',
                'html',
            })

            lsp.setup_servers({ 'tsserver', 'html' })
            lsp.set_preferences({})
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
        end
    },
    --############################### Snippets ###################################
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            require('lsp-zero.cmp').extend()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()


            ------------------- cmp.lua --------------------------separar en un futuro
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
                    ['<C-l>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c', 's' }),
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

            ---@diagnostic disable-next-line: different-requires
            require("luasnip/loaders/from_vscode").load({ include = { "javascript", "javascriptreact" } })

            ---@diagnostic disable-next-line: different-requires
            require("luasnip/loaders/from_vscode").lazy_load()

            luasnip.filetype_extend("javascript", { "html" })
            luasnip.filetype_extend("html", { "css" })

            vim.cmd [[
              set completeopt=menuone,noinsert,noselect
              highlight! default link CmpItemKind CmpItemMenuDefault
            ]]
        end
    },
    -- ############################## LSP config server ############################
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'williamboman/mason.nvim' },
        },
        config = function()
            local lsp = require('lsp-zero')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            --variables lspconfig
            local status, nvim_lsp = pcall(require, "lspconfig")
            if (not status) then return end
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                -- Mappings.
                local opts = { noremap = true, silent = true }

                -- See `:help vim.lsp.*` for documentation on any of the below functions
                buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            end

            ---------------------- lsp html -------------------------
            nvim_lsp.html.setup {
                cmd = { "vscode-html-language-server", "--stdio" },
                on_attach = on_attach,
                filetypes = { 'html' },
                capabilities = capabilities,

                init_option = {
                    configurationSection = { "html", "css", "javascript" },
                    embeddedLanguages = {
                        css = true,
                        javascript = true
                    },
                    provideFormatter = true
                },
                setting = {},
            }
            --------------------------------------------------------------

            ------------------------- lsp lua ----------------------------
            nvim_lsp.lua_ls.setup {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    on_attach(client, bufnr)
                    -- enable_format_on_save(client, bufnr)
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false
                        },
                    },
                },
            }
            --------------------------------------------------------------

            ------------------------- lsp CSS ----------------------------
            nvim_lsp.cssls.setup {}
            --------------------------------------------------------------

            ------------------------- lsp angularls ----------------------------
            local project_library_path = "/path/to/project/lib"
            local cmd = { "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations",
                project_library_path }
            require 'lspconfig'.angularls.setup {
                cmd = cmd,
                on_new_config = function(new_config, new_root_dir)
                    new_config.cmd = cmd
                end,
            }
            --------------------------------------------------------------

            ------------------------- lsp emmet ----------------------------
            nvim_lsp.emmet_ls.setup {
                cmd = { "emmet-ls", "--stdio" },
                capabilities = capabilities,
            }
            --------------------------------------------------------------

            lsp.setup()
        end
    },
    {
        --complement lspkind
        "onsails/lspkind-nvim",
        config = function()
            local status, lspkind = pcall(require, "lspkind")
            if (not status) then return end
            lspkind.init({
                mode = 'symbol',
                preset = 'codicons',
                symbol_map = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "ﰠ",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "塞",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "פּ",
                    Event = "",
                    Operator = "",
                    TypeParameter = ""
                },
            })
        end,
    }
}
