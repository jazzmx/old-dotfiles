call plug#begin('~/.config/nvim/plugged')

"--------------------------
" Visual plugins & themes
"--------------------------
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

"--------------------------
" General usage plugins
"--------------------------
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-sleuth'                   " Auto-indentation settings
Plug 'tpope/vim-repeat'                   " Enable repeating supported plugin maps with .
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/vim-endwise'                  " wisely add end statements i.e. endif
Plug 'tpope/vim-surround'                 " Change/delete/add surrounding (quotes,parentheses...)
Plug 'tpope/vim-unimpaired'               " Pairs of handy bracket mappings
Plug 'tpope/vim-eunuch'                   " Helpers for UNIX shell commands
Plug 'ahonn/resize.vim'                   " Resize splits
Plug 'voldikss/vim-floaterm'              " Floating terminal
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Plug 'mhinz/vim-startify'                 " Fancy vim start screen
"--------------------------
" Tmux
"--------------------------
" Plug 'edkolev/tmuxline.vim', { 'on': ['Tmuxline', 'TmuxlineSnapshot'] }
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'benmills/vimux'        " Launch tasks in tmux pane

"--------------------------
" Git
"--------------------------
Plug 'mhinz/vim-signify'                                   " Show diff status in sign column
Plug 'tpope/vim-fugitive'                                  " A git wrapper
Plug 'sodapopcan/vim-twiggy', { 'on': ['Twiggy'] }         " Git branch management
Plug 'rhysd/git-messenger.vim', { 'on': ['GitMessenger'] } " Show commit message under cursor

"--------------------------
" Syntax
"--------------------------
Plug 'sheerun/vim-polyglot'               " A solid language pack
Plug 'chrisbra/vim-kconfig'               " kconfig
" Plug 'hail2u/vim-css3-syntax'             " css3
" Plug 'cakebaker/scss-syntax.vim'          " scss
" Plug 'leafgarland/typescript-vim'         " typescript
" Plug 'leafOfTree/vim-vue-plugin'          " vue

"--------------------------
" Programming
"--------------------------
" Plug 'ervandew/matchem'
" Plug 'tmsvg/pear-tree'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'vue'] }
" Plug 'ap/vim-css-color'                   " Preview colors inline while editing
" Plug 'vim-scripts/taglist.vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }


"--------------------------
" Completion
"--------------------------
" DEOPLETE
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-lsp'
" let g:deoplete#enable_at_startup = 1

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'neovim/nvim-lsp'
" Plug 'haorenW1025/completion-nvim'
" Plug 'haorenW1025/diagnostic-nvim'




call plug#end()

