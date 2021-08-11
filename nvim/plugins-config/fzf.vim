"========================= FZF =========================
"archivos abiertos
nnoremap <leader>ls :Buffers <CR>

"muestra todos los archivos en ruta especificada
nnoremap <leader>ff :Files <C-R>=expand("~/myCode")<CR><CR>

"linea de codigo en el actual buffer palabra
"nnoremap <leader>fL :Rg <C-R>=expand("<cword>")<CR><CR>
"nnoremap <leader>fl :Ag <C-R>=expand("<cword>")<CR><CR>

"linea en el archivo actual
nnoremap <leader>fW :Lines  <CR>
nnoremap <leader>fw :BLines	 <CR>


"lista las marcas de archivo actual
"nnoremap <leader>fm :Marks 	    <CR>

"historial de bufers abierto
nnoremap <leader>LS :History 	<CR>

"historial de comandos ejecutados
nnoremap <leader>: :History: 	<CR>

"historial de busquedas
nnoremap <leader>/ :History/	<CR>

"mapeado de teclas
nnoremap <leader>fm :Maps	    <CR>

"command! -bang -nargs=? -complete=dir Files
    ""\ call fzf#vim#files(<q-args>, {'options': [ '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

let g:fzf_preview_window = 'up:55%'
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.9 } }

