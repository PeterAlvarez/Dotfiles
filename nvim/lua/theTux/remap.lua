vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "P", "mzJ`z")

-- scrool siempre en el medio
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--buscar next siempre en el medio
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- moverse en el buffer
vim.keymap.set("n", "<S-L>", "<cmd>bn<CR>zz")
vim.keymap.set("n", "<S-H>", "<cmd>bp<CR>zz")
--regresar a un buffer posteriro
vim.keymap.set("n", "<leader>e", "<cmd>b#<CR>")

-- de modo insertar a modo normal
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")

--guardar modificaciones en el archivo
vim.keymap.set("n", "<leader>w", "<cmd>wa<CR>")

--cerrar el buffer actual
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>")

-- insertar al final de la linea
vim.keymap.set('i', '<C-a>', '<Esc>$a')

-- final de archivo con focus mid
vim.keymap.set('n', 'G', 'Gzz<Esc>')

--compile config neovim
vim.keymap.set("n", "<leader>so", "<cmd>so<CR>")

--elimination caracter x
vim.keymap.set('n', 'x', '"_x')

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
vim.keymap.set('n', 'dw', 'vb"_d')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
vim.keymap.set('n', 'te', ':tabedit')
-- Split window
vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- " Create Blank Newlines and stay in Normal mode

vim.keymap.set('n', 'zj', 'o<Esc>k')
vim.keymap.set('n', 'zk', 'O<Esc>j')

-- Move window
-- vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sl', '<C-w>l')

-- Resize window
vim.keymap.set('n', '<C-w><left>', '<C-w><')
vim.keymap.set('n', '<C-w><right>', '<C-w>>')
vim.keymap.set('n', '<C-w><up>', '<C-w>+')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')
