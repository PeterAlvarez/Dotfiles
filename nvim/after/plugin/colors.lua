function ColorMyPencils(color)
    color = color or "neosolarized"
    -- color = color or "oh-my-monokai"
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

