"======================== COC Completion  ============================
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"Para expandir con TAB
inoremap <silent><expr><TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"Busca palabra en todos los buffer
nnoremap <leader>fP :CocSearch <C-R>=expand("<cword>")<CR><CR>
"rename
nmap <leader>rr <plug>(coc-rename)
"
" GoTo code navigation.
nmap <silent><space>vd <Plug>(coc-definition)
nmap <silent><space>vt <Plug>(coc-type-definition)
nmap <silent><space>vi <Plug>(coc-implementation)
nmap <silent><space>vr <Plug>(coc-references)

set updatetime=300

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.coc-sh
"nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
 "Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)coc-sh

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
  \ 'header':  ['fg', 'Comment'] } nmap <leader>f  <Plug>(coc-format-selected)



" Use K to show documentation in preview window.

nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap K a<Enter><ESC>

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]
