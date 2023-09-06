return {
    "Tsuzat/NeoSolarized.nvim",

    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    config = function()
        require('NeoSolarized').setup({
            -- require('NeoSolarized').setup({
            comment_italics = true,
            background_set = false,
        })
        -- load the colorscheme here
        vim.cmd([[colorscheme NeoSolarized]])

        function ColorMyPencils(color)
            color = color or "NeoSolarized"

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
        -- local status, n = pcall(require, "NeoSolarized")
        -- local status, n = pcall(require, "neoslarized")
        -- if (not status) then return end
        --
        -- n.setup({
        --     comment_italics = true,
        -- })

        -- local cb = require('colorbuddy.init')
        -- local Color = cb.Color
        -- local colors = cb.colors
        -- local Group = cb.Group
        -- local groups = cb.groups
        -- local styles = cb.styles
        --       
        -- Color.new('white', '#ffffff')
        -- Color.new('black', '#000000')
        -- Group.new('Normal', colors.base1, colors.NONE, styles.NONE)
        -- Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
        -- Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
        -- Group.new('Visual', colors.none, colors.base03, styles.reverse)
        --       
        -- local cError = groups.Error.fg
        -- local cInfo = groups.Information.fg
        -- local cWarn = groups.Warning.fg
        -- local cHint = groups.Hint.fg
        --       
        -- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
        -- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
        -- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
        -- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
        -- Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
        -- Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
        -- Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
        -- Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
        --       
        -- Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)
    end,
}


