call plug#begin('~/.config/nvim/plugged')
"
" Visual plugins & themes
"Plug 'joshdick/onedark.vim'
"Plug 'jacoborus/tender.vim'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
"
" General usage plugins
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/vim-kconfig'
"Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-projectionist'

Plug 'Shougo/denite.nvim'
Plug 'chemzqm/denite-extra'
Plug 'JoZie/denite-make'
Plug 'vim-scripts/Smart-Tabs'
Plug 'vim-scripts/taglist.vim'
Plug 'mbbill/undotree'
"Plug 'sjl/gundo.vim'
"Plug 'vifm/neovim-vifm'

Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'cloudhead/neovim-fuzzy'
"Plug 'tpope/vim-obsession'
"Plug 'dhruvasagar/vim-prosession'
Plug 'tpope/vim-Fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
Plug 'dyng/ctrlsf.vim'
Plug 'vimwiki/vimwiki'

"
" tmux integration
"Plug 'edkolev/tmuxline.vim'
"Plug 'christoomey/vim-tmux-navigator'

"
" Directory browsing
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }

"
" C & C++ specific plugins
"Plug ervandew/supertab
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'ericcurtin/CurtineIncSw.vim'
"
"Plug 'zchee/deoplete-clang'
"Plug 'rzaluska/deoplete-rtags'
"Plug 'marxin/neo-rtags'

call plug#end()

