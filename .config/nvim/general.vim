" from COC plugin
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

set noshowmode
set number        " show line numbers
set cursorline    " highlight current line
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete command
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
set title         " change the terminal's title
set visualbell    " don't beep
set noerrorbells  " don't beep
set ttyfast
set mouse=a
set exrc          " Allow loading local vimrc files for project specific settings
set secure        " Restrict commands usage on local vimrc files
set switchbuf=usetab,newtab
" }}}

" ==============================================
" Search settings
"
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching...
set smartcase     " ... unless we type a capital
set hlsearch      " highlight matches
set incsearch     " search as we type
set showmatch     " highlight matching [{()}]
"

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
set autoindent      " always set autoindenting on
set smartindent
"set copyindent      " copy the previous indentation on autoindenting
"set preserveindent
"set cindent
set cinoptions+=g0
"set complete=.,b,u,]
set completeopt=menuone,preview
set wildmode=longest,list:longest
"

" ==============================================
" Splits settings
"
set splitbelow      " Open new horizontal split on the bottom
set splitright      " Open new vertical split to the right
" Auto resize Vim splits to active split
"set winwidth=104
"set winheight=30
"set winminheight=5
"set winheight=999
" Display extra whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Always use vertical diffs
set diffopt+=vertical

