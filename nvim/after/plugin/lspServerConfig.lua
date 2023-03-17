local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


-- local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

-- local enable_format_on_save = function(_, bufnr)
--     vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup_format,
--         buffer = bufnr,
--         callback = function()
--             vim.lsp.buf.format({ bufnr = bufnr })
--         end,
--     })
-- end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
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
-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- nvim_lsp.tsserver.setup {
--     on_attach = on_attach,
--     cmd = { "typescript-language-server", "--stdio" },
--     capabilities = capabilities
-- }

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

nvim_lsp.emmet_ls.setup {
    cmd = { "emmet-ls", "--stdio" },
    capabilities = capabilities,
}

require 'lspconfig'.sqls.setup {
    capabilities = capabilities,
    on_attach = on_attach,

    cmd = { "sqls" },
    filetypes = { "sql", "mysql" },
    settings = {
        sqls = {
            connections = {
                {
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=root password=root dbname=ejemplo sslmode=disable',
                },
                {
                    driver = 'postgresql',
                    dataSourceName = 'host=127.0.0.1 port=5432 user=root password=root dbname=base2 sslmode=disable',
                },
            },
        },
    },
}

nvim_lsp.cssls.setup {
    cmd = { "vscode-css-language-server", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "scss", "less" },
}

nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

local lsp = require('lsp-zero')
lsp.preset('recommended')

-- lsp.setup_servers({
--     -- 'eslint',
--     'angularls',
--     opts = {
--         single_file_support = false,
--         on_attach = function(client, bufnr)
--             print("I'm doing web dev")
--         end
--     }
-- })
-- require('lspconfig')['eslint'].setup {
--     capabilities = capabilities
-- }
-- reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

-- lsp.setup_servers({
--     'eslint',
--     'angularls',
--     opts = {
--         single_file_support = false,
--         on_attach = function(client, bufnr)
--             print("I'm doing web dev")
--         end
--     }
-- })
local project_library_path = "/path/to/project/lib"
local cmd = { "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations",
    project_library_path }

require 'lspconfig'.angularls.setup {
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end,
}

-- require 'lspconfig'.marksman.setup {}

-- =============== plugins java completion ===========
-- function! s:jdtls_start()
--   if executable(g:jdtls_command[0])
--     call nvim_buf_set_keymap(0, 'n', '<leader>dl', '<Cmd>JdtLsWorkspaceOutline<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>df', '<Cmd>JdtLsImportOrganize<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dd', '<Cmd>JdtLsJavaDoc<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dt', '<Cmd>JdtLsTestFile<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dn', '<Cmd>JdtLsTestNearest<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dc', '<Cmd>JdtLsTestCoverage<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dp', '<Cmd>JdtLsRunPackage<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dr', '<Cmd>JdtLsRunFile<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dv', '<Cmd>JdtLsDebugTestNearest<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>ds', '<Cmd>JdtLsSignatureHelp<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dm', '<Cmd>JdtLsExtractMethod<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dw', '<Cmd>JdtLsWhoIs<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>de', '<Cmd>JdtLsExtendSelection<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>di', '<Cmd>JdtLsImplementInterface<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dj', '<Cmd>JdtLsJavaReferences<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>da', '<Cmd>JdtLsAddImport<CR>', {})
--     call nvim_buf_set_keymap(0, 'n', '<leader>dk', '<Cmd>Jdt

-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = '/home/tux/myCode/workspace/' .. project_name
--
-- require 'lspconfig'.jdtls.setup {
--     cmd = {
--         'java',
--         '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--         '-Dosgi.bundles.defaultStartLevel=4',
--         '-Declipse.product=org.eclipse.jdt.ls.core.product',
--         '-Dlog.protocol=true',
--         '-Dlog.level=ALL',
--         '-Xms1g',
--         '--add-modules=ALL-SYSTEM',
--         '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--         '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--
--         -- 💀
--         '-jar',
--         '~/.config/nvim/lybrary/java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--         -- 💀
--         '-configuration', '~/.config/nvim/lybrary/java/jdt-language-server-1.9.0-202203031534/config_linux/',
--         -- 💀
--         '-data',  workspace_dir
--         -- '-data',  vim.fn.expand('~/.cache/jdtls')
--     },
--     root_dir = function(fname)
--         return require 'lspconfig'.util.find_git_ancestor(fname)  or  '/home/tux/myCode/workspace/myApp'
--     end,
--     -- root_dir = function(fname)
--     --     return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
--     -- end,
--     capabilities = capabilities,
-- }
--

