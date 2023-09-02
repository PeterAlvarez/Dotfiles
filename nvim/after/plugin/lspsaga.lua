local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
    ui = {
        winblend = 10,
        border = 'rounded',
        colors = {
            normal_bg = '#002b36'
        }
    }
})

local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_diagnostic<CR>', opts)
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
-- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- code action
-- local codeaction = require("lspsaga.codeaction")
-- vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
-- vim.keymap.set("v", "<leader>ca", function()
--     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
--     codeaction:range_code_action()
-- end, { silent = true })

local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    diagnostic_header_icon = "   ",
    -- code action title icon
    code_action_icon = " ",
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    rename_output_qflist = {
        enable = false,
        auto_open_qflist = false,
    },
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
    diagnostic_message_format = "%m %c",
    highlight_prefix = false,
}
