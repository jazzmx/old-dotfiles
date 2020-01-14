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

"--------------------------
" Git
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
" C & C++ specific
"--------------------------
Plug 'ericcurtin/CurtineIncSw.vim'

"--------------------------
" HTML/CSS
"--------------------------
Plug 'mattn/emmet-vim'

"--------------------------
" COC
"--------------------------
Plug 'neoclide/coc.nvim', {'branch':'release'}

let g:coc_global_extensions = [
 \   'coc-explorer',
 \   'coc-snippets',
 \   'coc-xml',
 \   'coc-html',
 \   'coc-json',
 \   'coc-css',
 \   'coc-tsserver',
 \   'coc-vetur',
 \   'coc-eslint',
 \   'coc-prettier',
 \   'coc-python',
 \]

let g:floaterm_position = 'center'

call plug#end()

