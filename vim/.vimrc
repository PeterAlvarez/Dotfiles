if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'honza/vim-snippets'        "snippets
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
Plug 'sainnhe/gruvbox-material'		"Escheme Pro
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
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'         "cerrado de parentesis corchetes etc
Plug 'ryanoasis/vim-devicons'       "iconos
Plug 'morhetz/gruvbox'

"======ELIMINAR PLUGINS======
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'sirver/ultisnips'        "snippets
"Plug 'valloric/youcompleteme'
"Plug 'natebosch/vim-lsc'
"Plug 'lifepillar/vim-gruvbox8'      "theme
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
set hidden
set expandtab           " enter spaces when tab is pressed
set textwidth=80        " Romper lines cuado sobre pasa los 120 caracteres
"set softtabstop=4
"set tabstop=4           " use 4 spaces to represent tab
"set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set showcmd             " show (partial) command in status line
set fillchars+=vert:\▏  " linea visualmente mejor xD.
set wildmenu 		" menu
set ruler 		" Always show current position
set cmdheight=1 	" Height of the command bar
set hid 		" A buffer becomes hidden when it is abandoned
set clipboard=unnamedplus
set noswapfile          "no crea archivos de intercambio .spw
set nobackup            "no archivos .bk
set incsearch           "Busqueda incremental de cadenas
set updatetime=300
set cul                 "visualiza la linea en la q estas

"set hlsearch "resaltado de busqueda
"set backspace=indent,eol,start
set wrap               "rompe las lineas q sobrepasen textwidth
"set colorcolumn=80      "line control code
"packloadall
"silent! helptags ALL " All messages and errors will be ignored.

"========================= my mapeo de tecla ====================
"desabilitando flechas
map <Up>  <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

"moverse en el buffer (up)
map <F7> :bprev<CR>
imap<F7> <Esc>:bprev<CR>i
map <F8> :bnext<CR>
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
nnoremap <leader>e :b #<CR>
nnoremap <leader>b :bdelete<CR>

"reducir y aumentar el tamanio de las ventanas abiertas
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>* :resize +5<CR>
nnoremap <leader>/ :resize -5<CR>
nnoremap <leader>u :resize <CR>
nnoremap <leader>y :vertical resize <CR>
nnoremap <leader>r :reg <CR>
"nnoremap <leader>l :winc l<CR>
"nnoremap <leader>h :winc h<CR>
"nnoremap <leader>k :winc k<CR>
"nnoremap <leader>j :winc j<CR>

"========================= NERDTree ============================
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
map <f1> :NERDTreeToggle<CR>


"========================= ColorScheme =========================
set background=dark
"colorscheme gruvbox-material
colorscheme gruvbox
"let g:gruvbox_invert_selection='0'
let g:gruvbox_material_background = 'hard' "soft medium poner antes del colorscheme
"========================== AirLine ============================
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 1 "pestanias buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'

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
"(desactiva IndenLine)
nnoremap <leader>gt :GitGutterLineHighlightsToggle <CR>
"siguiente cambio
nnoremap <leader>gn :GitGutterNextHunk 		   <CR>
"anterior cambio
nnoremap <leader>gm :GitGutterPrevHunk 		   <CR>
"Muestra los cambios en una linea
nnoremap <leader>gh :GitGutterPreviewHunk 	   <CR>

"========================= Surround =========================

"========================= FZF =========================
nnoremap <leader>fP :CocSearch <C-R>=expand("<cword>")<CR><CR>
"rename
nmap <leader>rr <plug>(coc-rename)
"archivos abiertos
nnoremap <leader>fb :Buffers 	<CR>
"muestra todos los archivos en ruta especificada
nnoremap <leader>ff :Files <C-R>=expand("~/myCode")<CR><CR>
"linea de codigo en el actual buffer
nnoremap <leader>fs :Lines <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fL :Lines 	    <CR>
"linea en el archivo actual
nnoremap <leader>fp :BLines <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fl :BLines	    <CR>
"lista las marcas de archivo actual
nnoremap <leader>fm :Marks 	    <CR>
"historial de bufers abierto
nnoremap <leader>ls :History 	<CR>
"historial de comandos ejecutados
nnoremap <leader>fh :History: 	<CR>
"historial de busquedas
nnoremap <leader>fH :History/	<CR>
"mapeado de teclas
nnoremap <leader>fm :Maps	    <CR>

let g:fzf_layout = { 'up': '60%' }
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': [ '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
let g:fzf_preview_window = 'right:50%'

"======================== Ranger ============================
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

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


"========================= EasyMotion  ======================
map zl <Plug>(easymotion-lineforward)
map zj <Plug>(easymotion-j)
map zk <Plug>(easymotion-k)
map zh <Plug>(easymotion-linebackward)

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

"========================= Config color ======================

set termguicolors
"guibg=cFOndo :color xterm256:
"guifg=#bdae93 , d5c4a1
"#1d2021
highlight Normal ctermbg=NONE ctermfg=NONE guifg=#bdae93 guibg=NONE
"#ed6663
highlight MyColors ctermbg=NONE ctermfg=NONE guifg=#fb4934 guibg=NONE
highlight MyColors2 ctermbg=NONE ctermfg=NONE guifg=#7b9e89 guibg=NONE

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
    let n=matchadd( 'MyColors2' , "</" )
    let n=matchadd( 'MyColors2' , ">" )
    let n=matchadd( 'MyColors2' , "<" )
endfunction
call Colors()
nnoremap <leader>co :call Colors()<CR>
"========================== config line code ======================
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
"========================== ventana activa =======================

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

"========================== Macros =====================
"@f => formatear codigo
"@c => copia todo el codigo
"@d => borra todo el codigo
"@u => espacios entre ()
inoremap ii <Esc>
