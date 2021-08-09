
" Nice menu when typing `:find *.py`
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'francoiscabrol/ranger.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'gruvbox-community/gruvbox'
Plug 'mhinz/vim-startify'

"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzy-native.nvim'
"Plug 'nvim-telescope/telescope-fzf-writer.nvim'
"Plug 'fannheyward/telescope-coc.nvim'
"Plug 'fhill2/telescope-ultisnips.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'vim-airline/vim-airline'
Plug 'sainnhe/gruvbox-material'
Plug 'tpope/vim-fugitive'		"Complemento a git
Plug 'airblade/vim-gitgutter'		"Complemento a git
Plug 'tpope/vim-surround'		"Importante mapeo shorcut tecla s
Plug 'easymotion/vim-easymotion'    "Busqueda Avanzada Importante
Plug 'scrooloose/nerdcommenter'		"Comentar linea de codigo
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'liuchengxu/vista.vim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Pocco81/TrueZen.nvim'

"Plug 'yamatsum/nvim-cursorline'
"Plug 'wfxr/minimap.vim'
"Plug 'rbgrouleff/bclose.vim'
"Plug 'honza/vim-snippets'
"Plug 'sirver/ultisnips'
"Plug 'jiangmiao/auto-pairs'         "cerrado de parentes
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'hrsh7th/nvim-compe'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'vijaymarupudi/nvim-fzf'
"Plug 'wellle/targets.vim'
"Plug 'xiyaowong/nvim-cursorword'
"Plug 'majutsushi/tagbar'
"Plug 'karb94/neoscroll.nvim'
"Plug 'dbeniamine/cheat.sh-vim'
"Plug 'xiyaowong/nvim-transparent'
call plug#end()


"========================= SetConfig ==========================
set number
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
"set laststatus=0set shiftwidth=4        " number of spaces to use for auto indent
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


"==================================================

"========================= ColorScheme =========================
set background=dark
"colorscheme gruvbox-material
colorscheme gruvbox
"let g:gruvbox_invert_selection='0'
let g:gruvbox_material_background = 'hard' "soft medium poner antes del colorscheme
"==================================================

"========================== AirLine ============================
let g:airline_theme = 'transparent'
let g:airline#extensions#tabline#enabled = 1 "pestanias buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '


nmap <A-q> <Plug>AirlineSelectPrevTab zz
nmap <A-w> <Plug>AirlineSelectNextTab zz
let g:airline_section_a = airline#section#create(['mode', ' ☰ ','%{&ff}',' ☰ ', '%{bufnr("%")}'])
let g:airline_section_z = "%p%% ☰ \ue0a1:%l/%L ☰ Col:%c"
let g:airline_section_c = airline#section#create(['%t'])
let g:airline_section_x = ''

let g:airline_powerline_fonts = 1
"let g:airline#extensions#battery#enabled = 1
"==================================================

"========================= Startify ==========================
map <F2> :Startify<CR>
"`b` (abrir en la misma ventana),`
" s` (abrir en división horizntal),
"`v` (abrir en división vertical)
"==================================================

"========================= my mapeo de tecla ====================
"desabilitando flechas
map <Up>  <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
"moverse en el buffer (up)
"map <A-w> :bnext<CR>zz
"map <A-q> :bprevious<CR>zz

"ir al final de la linea en modo (Insert)
imap <C-l> <Esc>$a

"autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript "!importante  xml a ts format
"==================================================

"======================== ranger ============================
let g:ranger_map_keys = 0
map <F3> :Ranger <CR>
"==================================================

"======================== treesitter ============================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "perl" },  -- list of language that will be disabled
  },
}
EOF
"==================================================

"========================= Mapeando tecla Leader ==============
let mapleader = " "

"Exit y guardar
nnoremap <leader>w :wa <CR>
nnoremap <leader>q :q <CR>


"cerrar secion buff de termClose
"au TermClose * call feedkeys("i")
augroup terminal_settings
    autocmd!
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    autocmd TermClose term://*
        "\ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
          \ if  (expand('<afile>') !~ "ranger")  |
          \   call nvim_input('<CR>')  |
          \ endif
augroup END

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


lua <<EOF
require'nvim-web-devicons'.get_icons()
EOF


""========================= GFugitive Gitgutter =========================
""Recupera una linea Modifica a un commit anterior
"nnoremap <leader>gh :GitGutterUndoHunk <CR>
""(desactiva IndenLine)
"nnoremap <leader>gt :GitGutterLineHighlightsToggle <CR>
""siguiente cambio
"nnoremap <leader>gn :GitGutterNextHunk 		   <CR>
""anterior cambio
"nnoremap <leader>gp :GitGutterPrevHunk 		   <CR>
""Muestra los cambios en una linea
"nnoremap <leader>gd :GitGutterPreviewHunk 	   <CR>
"============================================================


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
"============================================================

"========================= AutoPairs   ======================
let g:AutoPairsMultilineClose=0
"============================================================
"========================= my Config Colors   ======================
set termguicolors
"guibg=cFOndo :color xterm256:
"guifg=#bdae93 , d5c4a1
"#1d2021
"#ed6663
highlight Normal ctermbg=NONE ctermfg=NONE guifg=#bdae93 guibg=NONE
highlight MyColors ctermbg=NONE ctermfg=NONE guifg=#fb4934 guibg=NONE
highlight MyColors2 ctermbg=NONE ctermfg=NONE guifg=#7b9e89 guibg=NONE


hi SignColumn guibg=NONE
hi CursorLineNR guibg=NONE
highlight LineNr guifg=#83a598
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

"========================== floding =====================
set foldmethod=manual
set nofoldenable
"nnoremap mm zfi}

"========================= Macros =====================
"@f => formatear codigo
"@c => copia todo el codigo
"@d => borra todo el codigo
"@u => espacios entre ()

"inoremap ii <Esc>

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
nnoremap <leader>fc gg=G''
nnoremap <leader>cp ggyG''
nnoremap <leader>dd ggdG
noremap <leader>aa ggVG

"Mover lineas
vnoremap <C-j> :m '>+1 <CR>gv=gv
vnoremap <C-k> :m '<-2 <CR>gv=gv





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

"========================== tab sangria ======================
augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

"inoremap jk <esc>
"inoremap kj <esc>
inoremap <Esc> <C-c>
"nmap <silent><space>vd <Plug>(coc-definition)
nmap dD 0D

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

"\ { 'fg':      ['fg', 'netrwList'],
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

"====== UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

hi CocErrorSign guibg=NONE guifg=#fb4934
hi CocWarningSign guibg=NONE guifg=#fe8019
hi CocInfoSign guibg=NONE guifg=#83a598
hi CocHintSign guibg=NONE guifg=#8ec07c
hi CocErrorFloat guifg=#fb4934
hi VertSplit ctermfg=241 ctermbg=235 guifg=#665c54 guibg=NONE

"========NERDTree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
map <leader>nn :NERDTreeToggle<CR>
"map <leader>nf :NERDTreeFind<CR>

set lazyredraw
set ttyfast
"=================== NEOSCROLL=====

" set backupdir=~/.cache/vim " Directory to store backup files.
"
""=================  Viste  =====
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

let g:vista_fzf_preview = ['right:50%']
let g:vista_sidebar_width=45
"Vista finder ctags => atajo
"
"=========== Ident Blankline ========
"lua << EOF
"require("indent_blankline").setup { }
"EOF
let g:indent_blankline_use_treesitter = v:true
"let g:indent_blankline_space_char = v:true
let g:indent_blankline_space_char = ' '
let g:indent_blankline_show_current_context = v:true
"let g:indent_blankline_char_highlight_list = v:true
let g:indent_blankline_show_current_context= v:true
let g:indent_blankline_filetype_exclude = ['help', 'packer']

let g:indent_blankline_enabled = v:true
let g:indent_blankline_filetype_exclude = ['help', 'nerdtree', 'vista', 'startify', 'fzf', 'easymotion']
let g:indent_blankline_buftype_exclude = ['terminal']
let g:indent_blankline_char = '│'
let g:indent_blankline_char_highlight = 'indentline'
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_context_patterns = ['class',
            \'function',
            \'method',
            \'^if',
            \'^while',
            \'^typedef',
            \'^for',
            \'^object',
            \'^table',
            \'block',
            \'arguments',
            \'typedef',
            \'while',
            \'^public',
            \'return',
            \'if_statement',
            \'else_clause',
            \'jsx_element',
            \'jsx_self_closing_element',
            \'try_statement',
            \'catch_clause',
            \'import_statement']
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_extra_indent_level = -1
