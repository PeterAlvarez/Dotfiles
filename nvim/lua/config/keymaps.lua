local discipline = require("craftzdog.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set(
  "n",
  "<Leader>fo",
  ":lua vim.lsp.buf.format({formatting_options = { tabSize = 4, insertSpaces = true }})<CR>",
  s
)
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
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

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

--myconfig
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Return line and zz
keymap.set("n", "''", "''zz")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

--buscar next siempre en el medio
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- moverse en el buffer
keymap.set("n", "<S-L>", "<cmd>bn<CR>:echo 'Next Buffer'<CR>zz")
keymap.set("n", "<S-H>", "<cmd>bp<CR>:echo 'Prev Buffer'<CR>zz")

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
