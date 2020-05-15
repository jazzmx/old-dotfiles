" Custom mappings after loading
" vim sensible defaults
"

"set noshowmode
set number        " show line numbers
set cursorline    " highlight current line
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set showcmd       " display incomplete command
set autowrite     " Automatically :write before running commands
set title         " change the terminal's title
set visualbell    " don't beep
set noerrorbells  " don't beep
set ttyfast
set mouse=a
set switchbuf=usetab,newtab
" Display whitespace, eol, etc...
set list
set spelllang=en_us,fr_ca
set undodir=~/.config/nvim/undo
set undofile
set nojoinspaces  " Use only 1 space after . when joining lines

" default updatetime 4000ms is not good for async update
set updatetime=100

" For completion
set hidden
set cmdheight=2
set shortmess+=c
set signcolumn=yes

" ==============================================
" Search settings
set ignorecase    " case insensitive search
set smartcase     " ... unless we type a capital
set hlsearch      " highlight matches
set incsearch     " highlight as we type
set showmatch     " highlight matching [{()}]
set gdefault      " global search flag on by default

" ==============================================
" Editor settings
" set pastetoggle=<F2> " go in paste mode with autoindent off 
set nowrap
set expandtab       " tabs are spaces by default
set tabstop=3       " number of visual spaces per tab
set softtabstop=3   " number of spaces in tab when editing
set shiftwidth=3
set shiftround
set smartindent
"set copyindent      " copy the previous indentation on autoindenting
"set preserveindent
"set cindent
set cinoptions+=g0
"set complete=.,b,u,]
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,preview
set wildmode=longest,list:longest
set clipboard=unnamed
set clipboard+=unnamedplus

" ==============================================
" Splits settings
set splitbelow splitright
set fillchars+=vert:\  " Empty vert split bar
set diffopt+=vertical  " Always use vert diffs

" ==============================================
" Local vimrc
" Auto load local vim settings from .vimlocal files
"silent! so .vimlocal
set exrc          " Allow loading local vimrc files for project specific settings
set secure        " Restrict commands usage on local vimrc files
