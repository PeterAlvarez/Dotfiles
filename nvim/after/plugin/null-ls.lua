local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.prettierd.with({
            filetypes = { 'javascript', 'typescript', 'json', 'yaml', 'markdown' },
            args = { '--tab-width', '4', '--print-width', '80', '--max-line-length=80' },
        }),
        -- Formateador para archivos Python
        -- null_ls.builtins.formatting.black.with({
        --     filetypes = { 'python' },
        --     extra_args = { '--line-length', '80' },
        -- }),
        -- Formateador para archivos HTML
        null_ls.builtins.formatting.prettierd.with({
            filetypes = { 'html' },
            args = { '--tab-width', '2', '--print-width', '80', '--max-line-length=80' },
        }),
        null_ls.builtins.diagnostics.flake8,
    },
    save_after_format = false,
}


vim.api.nvim_create_user_command(
    'DisableLspFormatting',
    function()
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
    end,
    { nargs = 0 }
)
