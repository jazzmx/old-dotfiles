call plug#begin('~/.config/nvim/plugged')
"
"--------------------------
" Visual plugins & themes
"--------------------------
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

"--------------------------
" General usage plugins
"--------------------------
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'mhinz/vim-startify'
Plug 'ahonn/resize.vim'
"Plug 'edkolev/tmuxline.vim'
"Plug 'christoomey/vim-tmux-navigator'

"--------------------------
" Fuzzy finder
"--------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'dyng/ctrlsf.vim'

"--------------------------
" Git plugins
"--------------------------
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

"--------------------------
" File manager
"--------------------------
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"--------------------------
" Programming
"--------------------------
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/vim-kconfig'
"Plug 'vim-scripts/taglist.vim'
" Snippets manager
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch':'release'}

"--------------------------
" C & C++ specific plugins
"--------------------------
Plug 'ericcurtin/CurtineIncSw.vim'

"--------------------------
" Vue.js
"--------------------------
Plug 'posva/vim-vue'
Plug 'neoclide/coc-vetur'


"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'zchee/deoplete-clang'
"Plug 'rzaluska/deoplete-rtags'
"Plug 'marxin/neo-rtags'

"Plug 'shougo/denite.nvim'
"Plug 'chemzqm/denite-extra'
"Plug 'jozie/denite-make'


call plug#end()

