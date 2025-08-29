-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Select all
keymap.set("n", "<C-o>", "<cmd>w | echo '✏️ Save!!'<CR>")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations (revisar)
-- keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)
-- keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)

-- Jumplist (revisar)
-- keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics (deprecated)
-- keymap.set("n", "<C-j>", function()
--     vim.diagnostic.goto_next()
-- end, opts)

--myconfig
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

--Return line and zz
keymap.set("n", "''", "''zz")

-- keymap.set("n", "<C-d>", "<C-d>zz")
-- keymap.set("n", "<C-u>", "<C-u>zz")

--buscar next siempre en el medio
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- moverse en el buffer
-- keymap.set("n", "<S-L>", "<cmd>bn<CR>:echo 'Next Buffer'<CR>zz")
-- keymap.set("n", "<S-H>", "<cmd>bp<CR>:echo 'Prev Buffer'<CR>zz")

-- de modo insertar a modo normal
keymap.set("i", "jj", "<Esc>")
keymap.set("i", "kk", "<Esc>")

-- insertar al final de la linea
keymap.set("i", "<C-a>", "<Esc>$a")

-- final de archivo con focus mid
keymap.set("n", "G", "Gzz<Esc>")

-- Delete a word backwards
keymap.set("n", "dw", "diw")
keymap.set("n", "cw", "ciw")
keymap.set("n", "vw", "viw")

-- " Create Blank Newlines and stay in Normal mode
keymap.set("n", "zj", "o<Esc>k")
keymap.set("n", "zk", "O<Esc>j")

-- copy line
keymap.set("n", "yy", "$v^y")

keymap.set("n", "D", "^D")
keymap.set("n", "C", "^C")

-- escrolling best
keymap.set("n", "<C-u>", "6kzz")
keymap.set("n", "<C-d>", "6jzz")

-- vim.keymap.set("n", ";md", ":delm ", {
--   desc = "Delete mark",
-- })

vim.api.nvim_set_keymap("n", "L", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

------------------------ borrando atajos de teclado ------------------------
vim.keymap.del("n", ";")

------------------------ atajos marks Recall pluggin ------------------------

vim.keymap.set("n", ";Md", ":delm a-z<CR>", {
  desc = "Delete all marks [a-z] in file",
})

vim.keymap.set("n", ";MD", ":delm A-Z<CR>", {
  desc = "Delete all marks [A-Z] in file",
})

vim.keymap.set("n", ";Mn", ":delm 0-9<CR>", {
  desc = "Delete all marks [0-9] in file",
})

vim.keymap.set("n", ";MM", ":lua print('Info key')<CR>", {
  desc = "Delete mark line -> dm- ",
})

------------------------ atajos toggle BufferLine ------------------------

vim.keymap.set("n", "<leader>co", ":ToggleBufferline<CR>", {
  desc = "Toggle BufferLine",
})
