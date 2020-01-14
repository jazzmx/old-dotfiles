call plug#begin('~/.config/nvim/plugged')
"
"--------------------------
" Visual plugins & themes
"--------------------------
"Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

"Plug 'edkolev/tmuxline.vim'
"Plug 'christoomey/vim-tmux-navigator'

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
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'

"--------------------------
" Searching / Fuzzy finder
"--------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'dyng/ctrlsf.vim'

"--------------------------
" File manager
"--------------------------
" if has('nvim')
"   Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/defx.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'kristijanhusak/defx-icons'
" Plug 'kristijanhusak/defx-git'

"--------------------------
" Git plugins
"--------------------------
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

"--------------------------
" Programming
"--------------------------
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/vim-kconfig'
Plug 'ap/vim-css-color'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'vim-scripts/taglist.vim'

"--------------------------
" C & C++ specific plugins
"--------------------------
Plug 'ericcurtin/CurtineIncSw.vim'

"--------------------------
" HTML/CSS
"--------------------------
Plug 'mattn/emmet-vim'

" Autocomplete
"Plug 'neovim/nvim-lsp'
" COC auto-completion
Plug 'neoclide/coc.nvim', {'branch':'release'}

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'Shougo/deoplete-lsp'
"Plug 'zchee/deoplete-clang'

call plug#end()


let g:floaterm_position = 'center'

