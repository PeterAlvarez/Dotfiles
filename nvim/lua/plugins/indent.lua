return { 
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("indent_blankline").setup {
            -- space_char_blankline = " ",
            char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
                "IndentBlanklineIndent4",
                "IndentBlanklineIndent5",
                "IndentBlanklineIndent6",
            },
            space_char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
                "IndentBlanklineIndent4",
                "IndentBlanklineIndent5",
                "IndentBlanklineIndent6",
            },
            show_trailing_blankline_indent = false,
            show_current_context = true,
            show_end_of_line = true,
        }
        vim.opt.termguicolors = true

        -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#cc241d gui=nocombine]]
        -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#d79921 gui=nocombine]]
        -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98971a gui=nocombine]]
        -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#458588 gui=nocombine]]
        -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#689d6a gui=nocombine]]
        -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#d65d0e gui=nocombine]]


        vim.opt.list = true
        -- vim.opt.listchars:append "space:⋅"
        -- vim.opt.listchars:append "eol:↴"

        -- Deshabilitar indent-blankline para archivos de texto plano
        vim.g.indent_blankline_filetype_exclude = {'dbout'}

        vim.g.indent_blankline_char = '│'
    end,
}
