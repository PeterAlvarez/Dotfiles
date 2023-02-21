local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

-- let g:gitgutter_sign_added    ﱘ       ﭧ    = '      󰐭   '
-- let g:gitgutter_sign_modified           = ''
-- let g:gitgutter_sign_removed            = '               '

gitsigns.setup {
    signs                        = {
        add          = { text = '' },
        change       = { text = '' },
        delete       = { text = '' },
        topdelete    = { text = '' },
        changedelete = { text = '' },
        untracked    = { text = '' },
    },
    signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked          = true,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil, -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm                         = {
        enable = false
    },


}


vim.keymap.set('n', '<leader>gh', '<cmd>Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns prev_hunk<CR>zz')
vim.keymap.set('n', '<leader>gn', '<cmd>Gitsigns next_hunk<CR>zz')
vim.keymap.set('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>')

vim.keymap.set('n', '<leader>gdi', '<cmd>DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>gdc', '<cmd>DiffviewClose<CR>')
