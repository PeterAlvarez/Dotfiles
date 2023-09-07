return {
    "Tsuzat/NeoSolarized.nvim",

    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    config = function()
        require('NeoSolarized').setup({
            comment_italics = true,
            background_set = false,
            style = "dark", -- "dark" or "light"
            transparent = true, -- true/false; Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            -- enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = { bold = true },
                variables = {},
                string = { italic = true },
                underline = true, -- true/false; for global underline
                undercurl = true, -- true/false; for global undercurl
            },
            -- Set colorscheme to NeoSolarized
        })
        -- load the colorscheme here
        vim.cmd([[colorscheme NeoSolarized]])

        function ColorMyPencils(color)
            color = color or "NeoSolarized"
            -- color = color or "gruvbox-baby"

            vim.cmd.colorscheme(color)
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

            vim.cmd([[highlight GitSignsAddPreview gui=bold guifg=#719e07 guibg=NONE guisp=#719e07]])
            vim.cmd([[highlight GitSignsDeletePreview gui=bold guifg=#dc322f guibg=NONE]])
            vim.cmd([[highlight lspreferencetext gui=bold guifg=#dc322f guibg=NONE]])
            vim.cmd([[highlight FloatShadow guibg=NONE ]])

            --Which Key color
            vim.cmd([[highlight whichkeydesc gui=bold guifg=#2aa198 guibg=NONE]])
            vim.cmd([[highlight whichkeyseparator gui=bold guifg=#586e75 guibg=NONE]])
            vim.cmd([[highlight WhichKey gui=bold guifg=#268bd2 guibg=NONE]])

            vim.cmd([[highlight FloatBorder gui=bold guifg=#458588]])
            vim.cmd([[highlight TelescopeTitle gui=bold guifg=#458588]])
            vim.cmd([[highlight FloatBorder gui=bold guifg=#458588]])

            vim.cmd([[highlight Visual guibg=NONE guifg=NONE gui=reverse]])

            --colors gitSing
            vim.cmd([[highlight DiffAdd guibg=#073642 guifg=#859900 ]])
            vim.cmd([[highlight DiffChange guibg=#073642 guifg=#268bd2 ]])
            vim.cmd([[highlight DiffDelete guibg=#073642 guifg=#dc322f ]])


            vim.cmd [[highlight IndentBlanklineIndent1 guifg=#cc241d gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent2 guifg=#d79921 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98971a gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent4 guifg=#458588 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent5 guifg=#689d6a gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent6 guifg=#d65d0e gui=nocombine]]

            vim.cmd [[ autocmd filetype typescript setlocal tabstop=4 shiftwidth=4 softtabstop=4 ]]


        end

        ColorMyPencils()

        -- Función para activar/desactivar colorcolumn
        function ToggleColorColumn()
            if vim.wo.colorcolumn == "" then
                vim.wo.colorcolumn = "80"
                print("Colorcolumn activated")
            else
                vim.wo.colorcolumn = ""
                print("Colorcolumn deactivated")
            end
        end
    end,
}


