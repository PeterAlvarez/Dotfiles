vim.opt.mouse = ""

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

function ColorMyPencils()
    vim.cmd([[highlight NeotreeNormalNc guibg=NONE]])
    vim.cmd([[highlight NeotreeNormal guibg=NONE]])
    vim.cmd([[highlight NeoTreeFloatNormal  guibg=NONE]])
    vim.cmd([[highlight NeoTreeFloatBorder  guifg=#27991f guibg=NONE]])

    vim.cmd([[highlight TelescopeBorder guifg=#27991f guibg=NONE]])
    vim.cmd([[highlight TelescopeNormal  guibg=NONE]])

    vim.cmd([[highlight WhichKeyFloat  guibg=NONE]])
    vim.cmd([[highlight WhichkeyBorder guifg=#27991f guibg=NONE]])

    --
    vim.cmd([[highlight GitSignsAddPreview gui=bold guifg=#719e07 guibg=NONE guisp=#719e07]])
    vim.cmd([[highlight GitSignsDeletePreview gui=bold guifg=#dc322f guibg=NONE]])

    vim.cmd([[highlight @ibl.indent.char.1 guifg=#657b83 gui=nocombine ]])
    vim.cmd([[highlight  MiniIndentscopeSymbol guifg=#cc241d gui=nocombine ]])
    vim.cmd([[highlight  Directory guifg=#27991f ]])
    vim.cmd([[highlight  LineNr guifg= #859900 ]])
    vim.cmd([[highlight  InclineNormal guifg=#000000 guibg=#27991f ]])
    vim.cmd([[highlight  WhichKeyDesc guifg=#27991f ]])
end

ColorMyPencils()

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.sidescrolloff = 6
vim.opt.scrolloff = 6
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
