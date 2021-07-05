
" Add builtin Cfilter plugin
packadd cfilter

call plug#begin('~/.config/nvim/plugged')
"-----------------------------------------
" THEMES
" Plug 'tjdevries/colorbuddy.nvim'
" Plug 'npxbr/gruvbox.nvim'                                             " LUA Gruvbox implementation with treesitter support
" Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'                                       " Gruvbox implementation with treesitter support
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
"--- Custom Start screen
Plug 'mhinz/vim-startify'                                             " Fancy vim start screen
" Plug 'glepnir/dashboard-nvim'
"-----------------------------------------
" GENERAL
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'romainl/vim-qf'                                                 " Quickfix/location lists enhancements
Plug 'tpope/vim-repeat'                                               " Enable repeating supported plugin maps with .
" Plug 'tpope/vim-endwise'                                              " wisely add end statements i.e. endif
Plug 'tpope/vim-surround'                                             " Change/delete/add surrounding (quotes,parentheses...)
Plug 'tpope/vim-unimpaired'                                           " Pairs of handy bracket mappings
" Plug 'tpope/vim-eunuch'                                               " Helpers for UNIX shell commands
Plug 'moll/vim-bbye'                                                  " Close buffers
Plug 'ptzz/lf.vim'                                                    " Lf floaterm
Plug 'voldikss/vim-floaterm'                                          " Floating terminal
Plug 'simeji/winresizer'
" ----------------------------------------
" MAKE & ASYNC RUN
" Plug 'skywind3000/asyncrun.vim'
" Plug 'skywind3000/asynctasks.vim'
" Plug 'neomake/neomake'
" ----------------------------------------
" FUZZY FIND, SEARCH & REPLACE
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'                                               " Fuzzy finder
Plug 'mhinz/vim-grepper'
" Plug 'qalshidi/vim-bettergrep'
" Plug 'dkprice/vim-easygrep'
" Plug 'wincent/loupe'                                                  " Enhanced in-file search
" Plug 'wincent/ferret'                                                 " Enhanced multi-file search
"-----------------------------------------
" GIT
Plug 'tpope/vim-fugitive'                                             " A git wrapper
" Plug 'mhinz/vim-signify'                                              " Show diff status in sign column
" Plug 'lewis6991/gitsigns.nvim'                                        " (Lua) signify replacement
" Plug 'rhysd/git-messenger.vim', { 'on': ['GitMessenger'] }            " Show commit message under cursor
"-----------------------------------------
" SYNTAX
" Plug 'sheerun/vim-polyglot'                                           " A solid language pack
" Plug 'chrisbra/vim-kconfig'                                           " kconfig
" Plug 'vimwiki/vimwiki'
"-----------------------------------------
" CODE
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'                                           " Comment stuff out
" Plug 'b3nj5m1n/kommentary', {'branch':'main'}                         " (Lua) comment
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'jsx', 'vue'] }
" Plug 'rstacruz/vim-hyperstyle'                                        " Shortcut for writing CSS
" Plug 'vim-scripts/taglist.vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
" Plug 'AndrewRadev/splitjoin.vim'
"-----------------------------------------
" LUA
" Plug 'svermeulen/vimpeccable'                                         " init.lua helper
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}           " We recommend updating the parsers on update
Plug 'JoosepAlviste/nvim-ts-context-commentstring', {'branch':'main'} " Multi-filetype comment
Plug 'lukas-reineke/indent-blankline.nvim', {'branch':'lua'}
" Plug 'windwp/nvim-ts-autotag'                                         " (Lua) Auto-closes html tags
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'norcalli/snippets.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
"-----------------------------------------
" TMUX
" Plug 'wincent/terminus'
" Plug 'edkolev/tmuxline.vim', { 'on': ['Tmuxline', 'TmuxlineSnapshot'] }
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'benmills/vimux'                                               " Launch tasks in tmux pane
"-----------------------------------------
" COMPLETION
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
" Plug 'glepnir/lspsaga.nvim', {'branch': 'main'}
" Plug 'folke/lsp-trouble.nvim'

call plug#end()
