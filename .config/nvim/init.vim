" To start vim without using this .vimrc file, use:
"     vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"
" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings.
" This setting must be as early as possible, as it has side effects.
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'tyrannicaltoucan/vim-quantum'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'dir': '~/bin/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()


let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

set termguicolors
set background=dark
colorscheme quantum
if has("termguicolors")
   set termguicolors
endif

"
" vim features
"
let mapleader = ","
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
"
" Search settings
"
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch      " highlight matches
set incsearch     " search as characters are entered
set showmatch     " highlight matching [{()}]
"nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
"
" Editor settings
"
set tabstop=3       " number of visual spaces per TAB
set softtabstop=3   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=3
set shiftround
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set preserveindent  "
set pastetoggle=<F2>  " when in insert mode, press <F2> to go to
                      "    paste mode, where you can paste mass data
                      "    that won't be autoindented"
"
" Splits settings
"
set splitbelow      " Open new horizontal split on the bottom
set splitright      " Open new vertical split to the right
" Auto resize Vim splits to active split
set winwidth=104
set winheight=10
set winminheight=5
set winheight=999

" Display extra whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Always use vertical diffs
set diffopt+=vertical

"
" Navigation
"
" Make ';'' act as ':'
nnoremap ; :
" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk
" Use tab to jump between bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" window splits
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
" buffer splits
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>
" open a split on the right and move to it
nnoremap <leader>r <C-w>v<C-w>l
" open a split on the bottom and move to it
nnoremap <leader>b <C-w>v<C-w>l

" Move lines around easily
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>
nnoremap <leader>u :GundoToggle<CR>

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
au FocusLost * :wa

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()


" Better find and replace
map <leader>fr :%s///g<left><left><left>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

"
" Airline settings
"
"let g:airline_theme='quantum'
let g:airline_theme='hybridline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"
" NerdTree settings
"
map <C-n> :NERDTreeToggle<CR>

