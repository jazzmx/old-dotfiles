"  _     _
" / \__/| \
" | |\/|| |      Maxime Langlois
" | |  || |_/\
" \_/  \|____/   https://github.com/mxlang
"
" ==========================================
"
" To start vim without using this .vimrc file, use:
"     vim -u NORC
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
" Type :so % to refresh .vimrc after making changes
"
" Profiling startup time
"     vim --startuptime vim-startup.log
"
" Open in debug mode:
"     vim -D file.txt
"  Debug a command
"     debug CommandName
"  Debug a fucntion
"     debug call FunctionName(arg)
"  Set verbose command
"     set verbose=9
"
" if v:progname == 'vi'
"   set noloadplugins
" endif

scriptencoding utf-8
" Specify python executable
" Avoid search, speeding up start-up.
if filereadable('/usr/local/bin/python3.6')
  let g:python3_host_prog = "/usr/local/bin/python3.6"
endif

command! Path :echo expand("%:p") 

" use_completion = ['coc','nvim-lsp']
let g:use_completion = 'nvim-lsp'

" wiki.vim
let g:wiki_root = '~/Documents/wiki'
let g:wiki_filetypes = ['wiki', 'md']
" Polyglot
let g:polyglot_disabled = ['autoindent']
" Editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" indent_blankline
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_buftype_exclude = ["terminal"]
" Vim DevIcons
let g:webdevicons_enable = 1
" Signify (Only Git)
let g:signify_vcs_list = [ 'git' ]
" vim-qf
let g:qf_mapping_ack_style = 1
let g:winresizer_vert_resize = 3
" lf.vim
let g:lf_replace_netrw = 1
"-----------------------------------------
" PLUGINS
"-----------------------------------------
" Add builtin Cfilter plugin
packadd cfilter
"-----------------------------------------
call plug#begin('~/.config/nvim/plugged')
"-----------------------------------------
" THEMES
" Plug 'tjdevries/colorbuddy.nvim'
" Plug 'npxbr/gruvbox.nvim'                                             " LUA Gruvbox implementation with treesitter support
Plug 'gruvbox-community/gruvbox'
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
Plug 'tpope/vim-endwise'                                              " wisely add end statements i.e. endif
Plug 'tpope/vim-surround'                                             " Change/delete/add surrounding (quotes,parentheses...)
Plug 'tpope/vim-unimpaired'                                           " Pairs of handy bracket mappings
Plug 'tpope/vim-eunuch'                                               " Helpers for UNIX shell commands
Plug 'moll/vim-bbye'                                                  " Close buffers
" Plug 'ptzz/lf.vim'                                                    " Lf floaterm
Plug 'voldikss/vim-floaterm'                                          " Floating terminal
Plug 'simeji/winresizer'
" ----------------------------------------
" MAKE & ASYNC RUN
" Plug 'skywind3000/asyncrun.vim'
" Plug 'skywind3000/asynctasks.vim'
" Plug 'neomake/neomake'
" ----------------------------------------
" FUZZY FIND, SEARCH & REPLACE
" Plug '~/.fzf'
" Plug 'junegunn/fzf.vim'                                               " Fuzzy finder
Plug 'mhinz/vim-grepper'
" Plug 'qalshidi/vim-bettergrep'
" Plug 'dkprice/vim-easygrep'
" Plug 'wincent/loupe'                                                  " Enhanced in-file search
" Plug 'wincent/ferret'                                                 " Enhanced multi-file search
"-----------------------------------------
" GIT
Plug 'tpope/vim-fugitive'                                             " A git wrapper
Plug 'mhinz/vim-signify'                                              " Show diff status in sign column
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
" Plug 'tpope/vim-commentary'                                           " Comment stuff out
" Plug 'b3nj5m1n/kommentary', {'branch':'main'}                         " (Lua) comment
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'jsx', 'vue'] }
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
if g:use_completion ==? 'coc'
  " COC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
elseif g:use_completion ==? 'nvim-lsp'
  " NVIM-LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'glepnir/lspsaga.nvim', {'branch': 'main'}
  " Plug 'hrsh7th/nvim-compe'
  " Plug 'folke/lsp-trouble.nvim'
endif
call plug#end()
"-----------------------------------------
"-----------------------------------------


if has('termguicolors')
   set termguicolors
endif

" Enable this after loading plugins
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" After this file is sourced, plugin code will be evaluated (./plugin)
" See ./after for files evaluated after that.
" See `:scriptnames` for a list of all scripts, in evaluation order.
" Launch Vim with `vim --startuptime vim.log` for profiling info.

