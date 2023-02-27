--base lua

vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.cmd([[ autocmd FileType html setlocal ts=2 sw=2 expandtab ]])

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.opt.laststatus = 2
vim.opt.scrolloff = 6
vim.opt.shell = 'fish'
vim.opt.backupskip = 'tmp/*,/private/tmp/*'


vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"

vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.ai = true --auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false --No wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } --Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.g.mapleader = " "

--Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])


-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})

-- Add asterisks in
-- Add asterisks in block comments

vim.opt.formatoptions:append { 'r' }

-- clipboard copy paste
vim.opt.clipboard = "unnamedplus"
