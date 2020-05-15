nnoremap ; :
let mapleader = "'"
" don't use Ex mode, quit instead
nnoremap Q :q<cr>
" Escape is <C-c> or <C-[>
" Also clears highlighted search
noremap <C-c> <esc>:set nohls<cr>
noremap <C-[> <esc>:set nohls<cr>
" Switch to last file
nnoremap <leader><leader> <C-^>
" fast save / quit
noremap <leader>w <esc>:w<return>
noremap <leader>q <esc>:q<return>
noremap <leader>Q! <esc>:qa!<return>
noremap <leader>QW <esc>:wqa<return>
" fast edit configs
nnoremap <leader>evv  :edit   $MYVIMRC<cr>
nnoremap <leader>evm  :edit   $HOME/.config/nvim/mappings.vim<cr>
nnoremap <leader>evp  :edit   $HOME/.config/nvim/plugins.vim<cr>
nnoremap <leader>evf  :edit   $HOME/.config/nvim/functions.vim<cr>
" smart Enter
" inoremap <silent><expr> <cr> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<cr>" : "\<C-g>u\<cr>")

" ==============================================
" NAVIGATION
" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk
" Disable arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
" Page up - page down without moving cursor
nnoremap <silent> <PageUp>   <C-U><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageUp>   <C-U><C-U>
vnoremap <silent> <PageDown> <C-D><C-D>

" ==============================================
" SPLITS
nmap <leader>s :split<return>
nmap <leader>v :vsplit<return>
" Navigate splits
nmap <C-h>      <C-w>h
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-l>      <C-w>l
nmap <C-Left>   <C-w>h
nmap <C-Down>   <C-w>j
nmap <C-Up>     <C-w>k
nmap <C-Right>  <C-w>l
" Resize splits
let g:resize_disable_mappings = 1
nnoremap <silent> <A-Up>     :ResizeUp<Cr>
nnoremap <silent> <A-Down>   :ResizeDown<Cr>
nnoremap <silent> <A-Left>   :ResizeLeft<Cr>
nnoremap <silent> <A-Right>  :ResizeRight<Cr>
nnoremap <silent> <A-=>      <C-w>=<Cr>

" ==============================================
" LINE OPERATIONS
" yank to the end of line
nnoremap Y y$
" keep visual selection when indenting/outdenting
vnoremap < <gv
vnoremap > >gv|
" Don't copy the contents of an overwritten selection.
vnoremap p "_dP
" move lines
vnoremap J :move '>+1<cr>gv=gv
vnoremap K :move '<-2<cr>gv=gv
" Split line at cursor, as J for join (default 'S' binding is same as 'cc')
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<cr>
" Increment and decrement
nnoremap + <C-a>
nnoremap - <C-x>

" ==============================================
" COMMAND LINE
" Expand to current dir in cmd mode
cnoremap %% <C-r>=expand('%:h').'/'<cr>
" navigation in command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" ==============================================
" SEARCH & REPLACE
" Find & replace word under cursor
nnoremap <leader>rw :%s/<C-r><C-w>/
" Grep word under cursor
nnoremap <leader>rg :RG <C-r><C-w><cr>

" ==============================================
" COMMENTARY
nnoremap //  :Commentary<cr>
vnoremap //  :Commentary<cr>

" ==============================================
" FLOATERM
nnoremap <silent> <C-t> :FloatermToggle<cr>
nnoremap <silent> <C-l> :FloatermNew lf<cr>
nnoremap <silent> <A-g> :FloatermNew gitsh<cr>

" ==============================================
" FZF
nnoremap <leader>b :Buffers<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-p> :Files<cr>
nnoremap <C-g> :GFiles<cr>
nnoremap <leader>fb  :Buffers<cr>
nnoremap <leader>ff  :Files<cr>
nnoremap <leader>fl  :BLines<cr>
nnoremap <leader>fgf :GFiles<cr>
nnoremap <leader>fgs :GFiles?<cr>
nnoremap <leader>fgc :Commits<cr>
nnoremap <leader>fgl :BCommits<cr>
nnoremap <leader>fh  :History:<cr>
nnoremap <leader>fs  :Snippets<cr>
" project tags
nnoremap <leader>tp  :Tags<cr>
" buffer tags
nnoremap <leader>tt  :BTags<cr>
" Help tags
nnoremap <leader>th  :Helptags<cr>
" FZF actions
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-t': 'tab split'
  \}

" ==============================================
" FUGITIVE
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gd :Gdiff<cr>
" nmap <leader>ga :Git add %:p<cr><cr>
" nmap <leader>gc :Gcommit -v -q<cr>
" nmap <leader>gt :Gcommit -v -q %:p<cr>
" nmap <leader>ge :Gedit<cr>
" nmap <leader>gr :Gread<cr>
" nmap <leader>gl :silent! Glog<cr>:bot copen<cr>
" nmap <leader>gp :Ggrep<Space>
" nmap <leader>gm :Gmove<Space>
" nmap <leader>gb :Git branch<Space>
" nmap <leader>go :Git checkout<Space>
" nmap <leader>gps :Dispatch! git push<cr>
" nmap <leader>gpl :Dispatch! git pull<cr>

" ==============================================
" SIGNIFY
" Only Git
let g:signify_vcs_list = [ 'git' ]
" Jump to next and previous hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" Hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)

" ==============================================
" FUNCTION KEYS
" Grep word under cursor with F3
" map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<cr>
" Switch header / source .c*,.h*
" map <F5> :call CHeaderToggle()<cr>
" Call make
" map <F9> :make!<cr>

