if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

" Nice menu when typing `:find *.py`
"set wildmode=longest
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'honza/vim-snippets'        "snippets
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
Plug 'sainnhe/gruvbox-material'		"Escheme Pro
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'		"Tab line buttom
Plug 'ntpeters/vim-better-whitespace'	"Spacios en blanco
Plug 'christoomey/vim-tmux-navigator'	"moverse entre paneles
Plug 'sheerun/vim-polyglot'		"Syntax global
Plug 'scrooloose/nerdcommenter'		"Comentar linea de codigo
Plug 'yggdroot/indentline'		"Identacion
Plug 'mhinz/vim-startify'		"iniciaMostrando cache anterior
Plug 'tpope/vim-fugitive'		"Complemento a git
Plug 'airblade/vim-gitgutter'		"Complemento a git
Plug 'tpope/vim-surround'		"Importante mapeo shorcut tecla s
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'	"Ranger integrado en vim
Plug 'uiiaoo/java-syntax.vim'		"Syntax for java
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'    "Busqueda Avanzada Importante
Plug 'jiangmiao/auto-pairs'         "cerrado de parentesis corchetes etc
Plug 'ryanoasis/vim-devicons'       "iconos
Plug 'terryma/vim-multiple-cursors' "multicursors
Plug 'wfxr/minimap.vim'            "minimap
Plug 'severin-lemaignan/vim-minimap'

"======ELIMINAR OBSOLETOS======

call plug#end()


"========================= Config vimEditor ===================
filetype plugin indent on    " required
filetype plugin on
syntax on               " opcional ( viene por defecto xd).
"set autowriteall
set nocompatible
set encoding=UTF-8
set number 		" numeros al costado del editor
set relativenumber      " relativo number
set hidden              "para mantener un buferEditado abierto
set textwidth=80        " Romper lines cuado sobre pasa los 120 caracteres
set expandtab           " enter spaces when tab is pressed
"set softtabstop=4
"set tabstop=4           " use 4 spaces to represent tab
"set shiftwidth=4        " number of spaces to use for auto indent
set signcolumn=yes
set autoindent          " copy indent from current line when starting a new line:
set showcmd             " show (partial) command in status line
set fillchars+=vert:\▏  " linea visualmente mejor xD.
set ruler 		" Always show current position
set cmdheight=1 	" Height of the command bar
set hid 		" A buffer becomes hidden when it is abandoned
set clipboard=unnamedplus
set noswapfile          "no crea archivos de intercambio .spw
set nobackup            "no archivos .bk
set incsearch           "Busqueda incremental de cadenas
set updatetime=300
"set cul                 "visualiza la linea en la q estas
set mouse=a             "Active mouse
"set hlsearch "resaltado de busqueda
"set backspace=indent,eol,start
set wrap               "rompe las lineas q sobrepasen textwidth
"set colorcolumn=80      "line control code
"packloadall
"silent! helptags ALL " All messages and errors will be ignored.
"set scrolljump=5 "salto cada 5 lineas al final de v
set scrolloff=10 "muestra 10 lineas abajo antes de llegar al final

"========================= my mapeo de tecla ====================
"desabilitando flechas
map <Up>  <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

"moverse en el buffer (up)
map <F7> :bprev<CR>zz
imap<F7> <Esc>:bprev<CR>i
map <F8> :bnext<CR>zz
imap<F8> <Esc>:bnext<CR>i
execute "set <F7>=\eq"
execute "set <F8>=\ew"

"ir al final de la linea en modo (Insert)
imap <C-l> <Esc>$a

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript "!importante  xml a ts format

"========================= Mapeando tecla Leader ==============
let mapleader = "\<Space>"

"Exit y guardar
nnoremap <leader>w :wa <CR>
nnoremap <leader>q :q <CR>

"nnoremap <leader>h :TmuxNavigateLeft<CR>
"nnoremap <leader>l :TmuxNavigateRight<CR>
nnoremap <leader>i :TmuxNavigatePrevious<CR>

"nnoremap <leader>p :buffer
nnoremap <leader>e :b #<CR>zz
nnoremap <leader>b :bdelete<CR>

"reducir y aumentar el tamanio de las ventanas abiertas
nnoremap <leader>/ :vertical resize +5<CR>
nnoremap <leader>* :vertical resize -5<CR>
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>u :resize <CR>
"Full Screen
nnoremap <leader>rf :tab split <CR>
"ventanas iguales
nnoremap <leader>re <c-w>= <CR>

"nnoremap <leader>y :vertical resize <CR>
"nnoremap <leader>l :winc l<CR>
"nnoremap <leader>h :winc h<CR>
"nnoremap <leader>k :winc k<CR>
"nnoremap <leader>j :winc j<CR>

"========================= NERDTree ============================
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
map <f1> :NERDTreeToggle<CR>
"map <leader>nf :NERDTreeFind<CR>

"========================= ColorScheme =========================
set background=dark
"colorscheme gruvbox-material
colorscheme gruvbox
"let g:gruvbox_invert_selection='0'
let g:gruvbox_material_background = 'hard' "soft medium poner antes del colorscheme

"========================== AirLine ============================
let g:airline_theme = 'gruvbox_material'
"let g:airline#extensions#tabline#enabled = 1 "pestanias buffer
"let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline_section_a = airline#section#create(['mode', ' ☰ ','%{&ff}',' ☰ ', '%{bufnr("%")}'])
let g:airline_section_z = "%p%% ☰ \ue0a1:%l/%L ☰ Col:%c"
let g:airline_section_c = airline#section#create(['%t'])


"========================= Whiteespace =========================
let g:strip_whitespace_on_save=1 		"Borra espacios enblando al guardar
let g:strip_whitespace_confirm=0		"eliminar confirmacion al borrar

"========================= navigator ==========================
"nnoremap :TmuxNavigatePrevious<cr>

"========================= Polyglot ===========================
"let g:polyglot_disabled = ['css'] 		Ejemplo

"========================= nerdcommenter ======================

"========================= IndenLine ==========================
let g:indentLine_char = '▏'

"========================= Startify ==========================
map <F2> :Startify<CR>
"`b` (abrir en la misma ventana),`
" s` (abrir en división horizntal),
"`v` (abrir en división vertical)

"========================= GFugitive Gitgutter =========================
"Recupera una linea Modifica a un commit anterior
nnoremap <leader>gh :GitGutterUndoHunk <CR>
"(desactiva IndenLine)
nnoremap <leader>gt :GitGutterLineHighlightsToggle <CR>
"siguiente cambio
nnoremap <leader>gn :GitGutterNextHunk 		   <CR>
"anterior cambio
nnoremap <leader>gp :GitGutterPrevHunk 		   <CR>
"Muestra los cambios en una linea
nnoremap <leader>gd :GitGutterPreviewHunk 	   <CR>

"========================= Surround =========================

"========================= FZF =========================

"archivos abiertos
nnoremap <leader>fb :Buffers <CR>

"muestra todos los archivos en ruta especificada
nnoremap <leader>ff :Files <C-R>=expand("~/myCode")<CR><CR>

"linea de codigo en el actual buffer
nnoremap <leader>fW :Lines <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fw :BLines <C-R>=expand("<cword>")<CR><CR>

"linea en el archivo actual
nnoremap <leader>fL :Lines 	    <CR>
nnoremap <leader>fl :BLines	    <CR>

"lista las marcas de archivo actual
"nnoremap <leader>fm :Marks 	    <CR>

"historial de bufers abierto
nnoremap <leader>fB :History 	<CR>

"historial de comandos ejecutados
nnoremap <leader>: :History: 	<CR>

"historial de busquedas
nnoremap <leader>/ :History/	<CR>

"mapeado de teclas
nnoremap <leader>fm :Maps	    <CR>

"let g:fzf_layout = { 'up': '60%' }
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': [ '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

"let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }

let g:fzf_colors =
    \ { 'fg':      ['fg', 'netrwList'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'GruvboxRedBold'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'NONE'],
    \ 'bg+':     ['bg', 'Normal', 'Normal'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'GruvboxRedBold'],
    \ 'border':  ['fg', 'netrwList'],
    \ 'prompt':  ['fg', 'PreProc'],
    \ 'pointer': ['fg', 'Special'],
    \ 'marker':  ['fg', 'GruvboxRedBold'],
    \ 'spinner': ['fg', 'GruvboxRedBold'],
    \ 'header':  ['fg', 'GruvboxRedBold'] }

"======================== ranger ============================
let g:ranger_map_keys = 0
map <F3> :Ranger <CR>

"======================== Java Syntax ============================

"======================== COC Completion  ============================
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"Para expandir con TAB
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

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
" Show commands.
"nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
 "Find symbol of current document.
nnoremap <silent><nowait> <space>l  :<C-u>CocList outline<cr>

" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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

"========================= EasyMotion  ======================
map zl <Plug>(easymotion-lineforward)
"map zj <Plug>(easymotion-j)
"map zk <Plug>(easymotion-k)
"Map zh <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
map  <leader>t <Plug>(easymotion-bd-w)
nmap <leader>t <Plug>(easymotion-overwin-w)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map  / <Plug>(easymotion-sn)
nmap / <Plug>(easymotion-tn)


"========================= AutoPairs   ======================
let g:AutoPairsMultilineClose=0

"========================= my Config Colors   ======================

set termguicolors
"guibg=cFOndo :color xterm256:
"guifg=#bdae93 , d5c4a1
"#1d2021
highlight Normal ctermbg=NONE ctermfg=NONE guifg=#bdae93 guibg=NONE
"#ed6663
highlight MyColors ctermbg=NONE ctermfg=NONE guifg=#fb4934 guibg=NONE
highlight MyColors2 ctermbg=NONE ctermfg=NONE guifg=#7b9e89 guibg=NONE


hi SignColumn guibg=NONE
hi CursorLineNR guibg=NONE
highlight Normal guibg=NONE
highlight LineNr guifg=#83a598
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

function Colors()
    let m=matchadd( 'MyColors' , ";" )
    let m=matchadd( 'MyColors' , "(" )
    let m=matchadd( 'MyColors' , ")" )
    let m=matchadd( 'MyColors' , "{" )
    let m=matchadd( 'MyColors' , "}" )
    let m=matchadd( 'MyColors' , "[" )
    let m=matchadd( 'MyColors' , "]" )
    let m=matchadd( 'MyColors' , ":" )
    let n=matchadd( 'MyColors2' , "=" )
    "let n=matchadd( 'MyColors2' , "</" )
    "let n=matchadd( 'MyColors2' , "<" )
    "let n=matchadd( 'MyColors2' , ">" )
endfunction
call Colors()
nnoremap <leader>co :call Colors()<CR>

"========================== config line code ======================
highlight ColorColumn ctermbg=0 guibg=#83a598
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"========================== ventana activa =======================

"========================== +Clipboard  =======================
"+clipboard "+p no funciona en vim nativo (arch)
"para solucionar el problema instale gvim
set clipboard=unnamedplus

"========================== Multiple-cursors =======================

"========================== Minimap ======================
let g:minimap_base_highlight='GruvboxGray'
let g:minimap_width = 20
"let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight = 'Special'
let g:minimap_highlight_range = 1

nnoremap <leader>mm :Minimap<CR>
nnoremap <leader>mc :MinimapClose<CR>
nnoremap <leader>mr :MinimapRefresh<CR>


"========================== Minimap 2 ======================
"let g:minimap_show='<leader>mm'
"let g:minimap_update='<leader>mu'
"let g:minimap_close='<leader>mc'
"let g:minimap_toggle='<leader>gt'
"let g:minimap_highlight='Special'

"========================== tab sangria ======================
" by default, the indent is 2 spaces.
set tabstop=4
set shiftwidth=4
set softtabstop=0

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
"autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
"autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
"autocmd Filetype py setlocal ts=4 sw=4 sts=0 expandtab
"autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab

"========================== floding =====================
set foldmethod=manual
set nofoldenable
"nnoremap mm zfi}

"========================= Macros =====================
"@f => formatear codigo
"@c => copia todo el codigo
"@d => borra todo el codigo
"@u => espacios entre ()

inoremap ii <Esc>

"========================= Session vim =====================
":mksession [ruta file][name file].vim => guarda sssion
nnoremap <leader>sm :mksession! ~/.mksession/

":source [ruta file][name file].vim => abre una session desde vim
nnoremap <leader>so :source ~/.mksession/
"$ vim -S [ruta file][name file].vim => abre una session desde vim desde teminal

"========================= Lineas en blanco =====================
nnoremap t o<Esc>
nnoremap T O<Esc>

nnoremap G Gzz<Esc>

"========================= Experimental ===================
nnoremap <leader>ft gg=G''
nnoremap <leader>cp ggyG''
nnoremap <leader>dd ggdG
noremap <leader>aa ggVG

"Mover lineas
vnoremap <C-j> :m '>+1 <CR>gv=gv
vnoremap <C-k> :m '<-2 <CR>gv=gv

"========================= colors Experimental ===================

