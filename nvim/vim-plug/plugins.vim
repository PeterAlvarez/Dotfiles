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
"Plug 'tpope/vim-fugitive'		"Complemento a git
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
Plug 'rbgrouleff/bclose.vim'

"Plug 'yamatsum/nvim-cursorline'
"Plug 'wfxr/minimap.vim'
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
