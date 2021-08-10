""========================== Telescope ==========================
""nnoremap <leader>ff <cmd>Telescope find_files<cr>=expand("~/myCode")<cr><cr>


"lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
"nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

"nnoremap <leader>ls :lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>ff :lua require('telescope.builtin').find_files{ cwd = '~/myCode'}<CR>
"nnoremap <leader>LS :lua require('telescope.builtin').oldfiles()<CR>
"nnoremap <leader>: :lua require('telescope.builtin').command_history()<CR>
"nnoremap <leader>/ :lua require('telescope.builtin').search_history()<CR>
"nnoremap <leader>pf :lua require('telescope.builtin').treesitter()<CR>
"nnoremap <leader>fw :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
"nnoremap <leader>fW :lua require('telescope.builtin').live_grep()<CR>

""===================== Complemento Telescope =================
""nnoremap <leader>ff :lua require('telescope').extensions.fzf_writer.files{ cwd = '~/myCode'}<CR>
""nnoremap <leader>fW :lua require('telescope').extensions.fzf_writer.staged_grep()<CR>

"lua << EOF
    "require('telescope').load_extension('fzy_native')
    "require('telescope').load_extension('ultisnips')
    "require('telescope').load_extension('coc')
"EOF
"let g:UltiSnipsExpandTrigger="<tab>"

""builtin.buffers	Enumera los búferes abiertos en la instancia actual de neovim
""builtin.file_browser	Enumera archivos y carpetas e
""builtin.oldfiles	Enumera los archivos abiertos anteriormente
""builtin.command_history	Enumera los comandos que se ejecutaron recientemente y los vuelve a ejecuta
""builtin.search_history	Enumera las búsquedas
""builtin.treesitter	Enumera los nombres de las funciones, las variables, de Treesitter.
""builtin.live_grep	Busque una cadena en su directorio de trabajo actual

""builtin.grep_string	Busca la cadena debajo del cursor en su directorio de trabajo actual
""builtin.keymaps	Muestra las asignaciones de teclas del modo normal
""builtin.current_buffer_fuzzy_find	Búsqueda difusa en vivo dentro del búfer abierto actualmente


""===========================Color Telescope ====================
"" Border highlight groups.
"highlight TelescopeBorder         guifg=#83a598
"highlight TelescopePromptBorder   guifg=#83a598
"highlight TelescopeResultsBorder  guifg=#83a598
"highlight TelescopePreviewBorder  guifg=#83a598

"" Used for highlighting characters that you match.
"highlight TelescopeMatching       guifg=#fb4934

""========================= AutoPairs   ======================
"let g:AutoPairsMultilineClose=0
""============================================================
