" Custom mappings after loading
" vim sensible defaults
"

" default updatetime 4000ms is not good for async update
set updatetime=100

" from COC plugin
set hidden
set cmdheight=2
set shortmess+=c
set signcolumn=yes

"set noshowmode
set number        " show line numbers
set cursorline    " highlight current line
"set backspace=2   " Backspace deletes like most programs in insert mode
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
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

" ==============================================
" Search settings
"
"set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching...
set smartcase     " ... unless we type a capital
set hlsearch      " highlight matches
set showmatch     " highlight matching [{()}]

" ==============================================
" Editor settings
"
set pastetoggle=<F2> " go in paste mode with autoindent off 
set nowrap
"set expandtab       " tabs are spaces
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
set completeopt=menuone,preview
set wildmode=longest,list:longest
set clipboard+=unnamed

" ==============================================
" Splits settings
set splitbelow      " Open new horizontal split on the bottom
set splitright      " Open new vertical split to the right
set diffopt+=vertical " Always use vertical diffs

" ==============================================
" Local vimrc
" Auto load local vim settings from .vimlocal files
"silent! so .vimlocal
set exrc          " Allow loading local vimrc files for project specific settings
set secure        " Restrict commands usage on local vimrc files
