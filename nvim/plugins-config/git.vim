"==========================================================
"                      Git Config
"==========================================================
"Recupera una linea Modifica a un commit anterior
nnoremap guh :GitGutterUndoHunk <CR>

"view next
nnoremap gn :GitGutterNextHunk<CR>

"view previe
nnoremap gp :GitGutterPrevHunk<CR>

"Muestra los cambios en una linea
nnoremap gv :GitGutterPreviewHunk<CR>

"icons
let g:gitgutter_sign_added              = ''
let g:gitgutter_sign_modified           = ''
let g:gitgutter_sign_removed            = ''
"let g:gitgutter_sign_added              = '█'
"==========================================================
