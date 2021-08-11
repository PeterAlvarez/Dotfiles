"==========================================================
"                      Git Config
"==========================================================
"Recupera una linea Modifica a un commit anterior
nnoremap <leader>guh :GitGutterUndoHunk <CR>

"view next
nnoremap <leader>gn :GitGutterNextHunk<CR>

"view previe
nnoremap <leader>gp :GitGutterPrev<CR>

"Muestra los cambios en una linea
nnoremap <leader>gv :GitGutterPreviewHunk<CR>

"icons
let g:gitgutter_sign_added              = ''
let g:gitgutter_sign_modified           = ''
let g:gitgutter_sign_removed            = ''
"let g:gitgutter_sign_added              = '█'
"==========================================================
