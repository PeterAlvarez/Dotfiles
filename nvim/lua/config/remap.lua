vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Return line and zz
vim.keymap.set("n", "''", "''zz")


-- vim.keymap.set("n", "P", "mzJ`z")

-- scrool siempre en el medio
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--buscar next siempre en el medio
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- greatest remap ever W
vim.keymap.set("x", "P", [["_dP]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- moverse en el buffer
vim.keymap.set("n", "<S-L>", "<cmd>bn<CR>:echo 'Next Buffer'<CR>zz")
vim.keymap.set("n", "<S-H>", "<cmd>bp<CR>:echo 'Prev Buffer'<CR>zz")

--regresar a un buffer posteriro W
-- vim.keymap.set("n", "<leader>e", "<cmd>b#<CR>")

-- de modo insertar a modo normal
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")

--guardar modificaciones en el archivo W
-- vim.keymap.set("n", "", "<cmd>so<CR>")

--cerrar el buffer actual W
-- vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>")

-- insertar al final de la linea
vim.keymap.set('i', '<C-a>', '<Esc>$a')

-- final de archivo con focus mid
vim.keymap.set('n', 'G', 'Gzz<Esc>')

--compile config neovim W
-- vim.keymap.set("n", "<leader>so", "<cmd>so<CR>")

--elimination caracter x
vim.keymap.set('n', 'x', '"_x')

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
vim.keymap.set('n', 'dw', 'diw')
vim.keymap.set('n', 'cw', 'ciw')

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

vim.keymap.set('n', 'yy', '$v^y')

--terminal mode visual
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

vim.keymap.set('n', 'Y', 'Vy')
vim.keymap.set('n', 'D', '0D')

-- scrolling best
vim.keymap.set('n', '<C-u>', '6kzz')
vim.keymap.set('n', '<C-d>', '6jzz')

-- Define una función para guardar el archivo y volver al modo normal
function SaveAndExitInsertMode()
    vim.cmd(':w')
    vim.cmd(':stopinsert')
end

-- Mapea la combinación de teclas Ctrl + S en el modo de inserción
-- vim.api.nvim_set_keymap('i', '<C-i>', '<Esc>:lua SaveAndExitInsertMode()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-o>', '<Esc>:lua SaveAndExitInsertMode()<CR>:echo "Save!!"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-o>', '<Esc>:lua SaveAndExitInsertMode()<CR>:echo "Save!!"<CR>', { noremap = true, silent = true })


--new line finish file
-- vim.api.nvim_set_keymap('n', '<C-o>', ":call append(line('$'), '')<CR>:echo 'New line bot'<CR>", { noremap = true })


-- vim.api.nvim_set_keymap('n', '<leader>o', ":call append(line('.'), '' )<CR>", { noremap = true, silent = true })

-- Función para insertar una línea en blanco encima de la línea actual sin mover el cursor
function insertBlankLineAbove()
    local current_line = vim.fn.line('.')
    vim.api.nvim_buf_set_lines(0, current_line - 1, current_line - 1, false, { '' })
end

-- Atajo de teclado para insertar una línea en blanco encima de la línea actual sin mover el cursor
-- vim.api.nvim_set_keymap('n', '<leader>i', ':lua insertBlankLineAbove()<CR>', { noremap = true, silent = true })

