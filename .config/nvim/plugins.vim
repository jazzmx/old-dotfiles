call plug#begin('~/.config/nvim/plugged')
"
"--------------------------
" Visual plugins & themes
"--------------------------
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
"Plug 'edkolev/tmuxline.vim'
"Plug 'christoomey/vim-tmux-navigator'

"--------------------------
" General usage plugins
"--------------------------
Plug 'tpope/vim-sensible'    " Defaults everyone can agree on
Plug 'tpope/vim-sleuth'      " Auto-adjust indentation settings
Plug 'tpope/vim-repeat'      " Enable repeating supported plugin maps with .
Plug 'tpope/vim-commentary'  " Comment stuff out
Plug 'tpope/vim-endwise'     " wisely add end statements i.e. endif
Plug 'tpope/vim-surround'    " Change/delete/add surrounding (quotes,parentheses...)
Plug 'tpope/vim-unimpaired'  " Pairs of handy bracket mappings
Plug 'tpope/vim-eunuch'      " Helpers for UNIX shell commands
Plug 'mhinz/vim-startify'    " Fancy vim start screen
Plug 'ahonn/resize.vim'      " Resize splits
Plug 'voldikss/vim-floaterm' " Floating terminal
Plug 'benmills/vimux'        " Launch tasks in tmux pane
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

"--------------------------
" Git
"--------------------------
Plug 'tpope/vim-fugitive'       " A git wrapper
Plug 'rhysd/git-messenger.vim'  " Show commit message under cursor 
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'      " Show a diff using Vim sign column
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

"--------------------------
" Syntax
"--------------------------
Plug 'sheerun/vim-polyglot'      " A solid language pack
Plug 'chrisbra/vim-kconfig'      " kconfig runtime files
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'          " Preview colours in source code while editing
Plug 'leafgarland/typescript-vim'
Plug 'leafOfTree/vim-vue-plugin'

"--------------------------
" Programming
"--------------------------
Plug 'tmsvg/pear-tree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
"Plug 'vim-scripts/taglist.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }


"--------------------------
" Completion
"--------------------------
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'Shougo/deoplete-lsp'
" let g:deoplete#enable_at_startup = 1

Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'



call plug#end()

