"==========================================================
"                      PLUGINS
"==========================================================
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plugins-config/ranger.vim
source $HOME/.config/nvim/plugins-config/treesitter.vim
source $HOME/.config/nvim/plugins-config/gruvbox.vim
source $HOME/.config/nvim/plugins-config/startif.vim
source $HOME/.config/nvim/plugins-config/devicons.vim
source $HOME/.config/nvim/plugins-config/git.vim
source $HOME/.config/nvim/plugins-config/sorround.vim
source $HOME/.config/nvim/plugins-config/easymotion.vim
source $HOME/.config/nvim/plugins-config/nerdcommenter.vim
source $HOME/.config/nvim/plugins-config/coc.vim
source $HOME/.config/nvim/plugins-config/nerdtree.vim
source $HOME/.config/nvim/plugins-config/vista.vim
source $HOME/.config/nvim/plugins-config/blankline.vim
source $HOME/.config/nvim/plugins-config/fzf.vim
source $HOME/.config/nvim/plugins-config/truezen.vim
source $HOME/.config/nvim/plugins-config/bufExplorer.vim
source $HOME/.config/nvim/plugins-config/airline.vim
"==========================================================



"==========================================================
"                      Config Vim Editor
"==========================================================
filetype plugin indent on    "required
syntax on                    "opcional ( viene por defecto xd).
"==========================================================



"==========================================================
"                      Ignore Files
"==========================================================
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
"==========================================================



"==========================================================
"                      Set Config
"==========================================================
"numbers Line
set ai "Auto indent
set nosc noru nosm
set number 		" numeros al costado del editor
set relativenumber      " relativo number

"set autowriteall
set nocompatible
set encoding=UTF-8
set hidden              "para mantener un buferEditado abierto
set textwidth=80        " Romper lines cuado sobre pasa los 120 caracteres
"set softtabstop=4
"set tabstop=4           " use 4 spaces to represent tab
"set laststatus=0set shiftwidth=4        " number of spaces to use for auto indent
set signcolumn=yes
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
set nohlsearch          "quita resaltado de busqueda
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
set nofoldenable "abrir un archivo con los plieuges abiertos
set termguicolors
set lazyredraw
set ttyfast
set cursorline
"==========================================================


"==========================================================
"                      Sangria Config
"==========================================================
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab           " enter spaces when tab is pressed

autocmd Filetype html setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
"autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
"==========================================================



"==========================================================
"                        Folding
"==========================================================
set foldmethod=manual
set nofoldenable
"nnoremap mm zfi}
"==========================================================



"==========================================================
"                       Tecla Leader
"==========================================================
let mapleader = " "

"Exit y guardar
nnoremap <leader>w :wa <CR>
"nnoremap <leader>q :q <CR>
"nnoremap <leader>h :TmuxNavigateLeft<CR>
"nnoremap <leader>l :TmuxNavigateRight<CR>
"nnoremap <leader>i :TmuxNavigatePrevious<CR>
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
"==========================================================



"==========================================================
"                       Colors
"==========================================================
"guibg=cFOndo :color xterm256:
"guifg=#bdae93 , d5c4a1
"#1d2021
"#ed6663
highlight Normal ctermbg=NONE ctermfg=NONE guifg=#bdae93 guibg=NONE
highlight MyColors ctermbg=NONE ctermfg=NONE guifg=#fb4934 guibg=NONE
highlight MyColors2 ctermbg=NONE ctermfg=NONE guifg=#7b9e89 guibg=NONEfriday
hi SpecialKey cterm=bold ctermfg=11 ctermbg=0 gui=bold guifg=#657b83 guibg=NONE
hi LineNr  ctermbg=0 guifg=#83a598 guibg=NONE

hi SignColumn guibg=NONE
hi CursorLineNR guibg=NONE
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

"Coc Colors Config
hi CocErrorSign guibg=NONE guifg=#fb4934
hi CocWarningSign guibg=NONE guifg=#fe8019
hi CocInfoSign guibg=NONE guifg=#83a598
hi CocHintSign guibg=NONE guifg=#8ec07c
hi CocErrorFloat guifg=#fb4934
hi VertSplit ctermfg=241 ctermbg=235 guifg=#665c54 guibg=NONE

"CursorLine
"CursorLine ctermbg=0 guibg=#073642 guisp=#93a1a1

"Fzf Colors Config
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
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

"Git
hi GitGutterAdd guibg=NONE guifg=#b8bb26
hi GitGutterChange guibg=NONE guifg=#8ec07c
hi GitGutterDelete guibg=NONE guifg=#fb4934
"==========================================================



"==========================================================
"                     Sangria Config
"==========================================================
augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
"==========================================================


"==========================================================
"                        My Maps
"==========================================================
"Disable Arrow
map <Up>  <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

"Mode (Insert)
imap <C-l> <Esc>$a

"Experimental
nnoremap <leader>fc gg=G''
nnoremap <leader>cp ggyG''
nnoremap <leader>dd ggdG
noremap <leader>aa ggVG

"Move Line (Visual)
vnoremap <C-j> :m '>+1 <CR>gv=gv
vnoremap <C-k> :m '<-2 <CR>gv=gv

"new Line (Command)
nnoremap t o<Esc>
nnoremap T O<Esc>

"Scroll Bot (Command)
nnoremap G Gzz<Esc>

"Miselanea
inoremap <Esc> <C-c>
nmap dD 0D
"==========================================================



"==========================================================
"                      Session Vim Salve
"==========================================================
":mksession [ruta file][name file].vim => guarda sssion
nnoremap <leader>sm :mksession! ~/.mksession/

":source [ruta file][name file].vim => abre una session desde vim
nnoremap <leader>so :source ~/.mksession/
"$ vim -S [ruta file][name file].vim => abre una session desde vim desde teminal
"==========================================================
let g:rainbow_active = 1


"==========================================================
"                       Backup Dir
"==========================================================
" set backupdir=~/.cache/vim " Directory to store backup files.
"==========================================================



"==========================================================
"                         Macros
"==========================================================
"@f => formatear codigo
"@c => copia todo el codigo
"@d => borra todo el codigo
"@u => espacios entre ()

"==========================================================
"                         Move window
"==========================================================
map eh <C-w>h
map ek <C-w>k
map ej <C-w>j
map el <C-w>l
