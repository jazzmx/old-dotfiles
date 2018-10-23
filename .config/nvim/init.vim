" To start vim without using this .vimrc file, use:
"     vim -u NORC
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings.
" This setting must be as early as possible, as it has side effects.
set nocompatible

" ==============================================
" Plugins {{{
"
call plug#begin('~/.config/nvim/plugged')
"
" Color themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'
"
" Visual plugins
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
"
" General usage plugins
Plug 'sheerun/vim-polyglot'
"Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
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
Plug 'christoomey/vim-tmux-navigator'
"Plug 'tpope/vim-obsession'
"Plug 'dhruvasagar/vim-prosession'
Plug 'tpope/vim-Fugitive'
Plug 'airblade/vim-gitgutter'
"
" Directory browsing
"Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"
" C & C++ specific plugins
Plug 'Shougo/deoplete.nvim'
Plug 'rzaluska/deoplete-rtags'
"Plug 'zchee/deoplete-clang'
Plug 'ericcurtin/CurtineIncSw.vim'

call plug#end()
" }}}


if has('autocmd')
  filetype plugin indent on
endif

" ==============================================
" Visual/theme/colors settings {{{
" 
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
if has('nvim')
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"if has('patch-7.4.1778')
"   set guicolors
"endif
if !has('gui')
   " ^[ is a single character: Ctrl+V,<ESC>
   let &t_8f = "[38;2;%lu;%lu;%lum"
   let &t_8b = "[48;2;%lu;%lu;%lum"
   "set termguicolors
   set t_ut=
endif
if has("termguicolors")
   set termguicolors
endif
if !has('gui_running')
  set t_Co=256
endif

colorscheme gruvbox
set background=dark
let g:airline_theme='hybrid'
let g:lightline = { 'colorscheme': 'wombat' }
hi CursorLine ctermbg=Black guibg=#161616
set guifont=Inconsolata\ Nerd\ Font\ Complete\ Mono\ 11
" }}}

" ==============================================
" vim features {{{
"
let mapleader = ","
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
set expandtab       " tabs are spaces
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
"set winheight=10
"set winminheight=5
"set winheight=999
" Display extra whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Always use vertical diffs
set diffopt+=vertical

" Disable highlight with esc
nnoremap <esc> :noh<return><esc>
" Quickly edit/reload vimrc
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>rv :so $MYVIMRC<CR>

" ==============================================
" Navigation {{{
"
" Make ';'' act as ':'
nnoremap ; :
" Quick save
nnoremap <C-s> :update<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-Q> :qa<CR>
" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk
" Use tab to jump between bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" Page up - page down without moving cursor
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>
" window splits
nmap <leader>swh  :topleft  vnew<CR>
nmap <leader>swj  :botright new<CR>
nmap <leader>swk  :topleft  new<CR>
nmap <leader>swl  :botright vnew<CR>
" buffer splits
nmap <leader>sh   :leftabove  vnew<CR>
nmap <leader>sj   :rightbelow new<CR>
nmap <leader>sk   :leftabove  new<CR>
nmap <leader>sl   :rightbelow vnew<CR>

" Move lines around easily
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<CR>
"nnoremap <leader>u :GundoToggle<CR>

" Better find and replace
map <leader>fr :%s///g<left><left><left>

" Switch header / source .c*,.h*
map <F5> :call CurtineIncSw()<CR>
" Call make
map <F9> :make!<CR>
nnoremap <F6> :%s/<C-r><C-w>/

" Grep word under cursor with K
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Grep word under cursor with F3
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
"nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
au FocusLost * :wa

"
" Relative numbering {{{
" Toggle relative numbering, and set to absolute on loss of focus or insert mode
"
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
" }}}

"
" Ripgrep {{{
"
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
  nnoremap <C-g> :Rg<Cr>
endif
" }}}

"
" FZF {{{
"
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
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
" }}}

"
" Lightline / Airline / Tmuxline {{{
"
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tmuxline#enabled = 0
"let g:airline#extensions#wordcount#enabled = 0
"
" Tmuxline
"
let g:tmuxline_theme = 'iceberg'
let g:tmuxline_preset = 'nightly_fox'
" }}}


" NERDTree {{{
"
map <C-n> :NERDTreeToggle<CR>
" close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

"
" YouCompleteMe {{{
"
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
" }}}

"
" Deoplete {{{
"
let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-4.0/lib/libclang-4.0.so'
" }}}

"
" Denite {{{
" 
" Change file_rec command.
"call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
"call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
" }}}

" Auto load local vim settings from .vimlocal files
silent! so .vimlocal

