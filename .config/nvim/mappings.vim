nnoremap ; :
let mapleader = "'"
" Escape is <C-c> or <C-[>
" Also clears highlighted search
noremap <C-c> <esc>:set nohls<cr>
noremap <C-[> <esc>:set nohls<cr>
" fast save / quit
noremap <leader>w <esc>:w<return>
noremap <leader>q <esc>:q<return>
noremap <leader>Q <esc>:wqa<return>
" fast splits
noremap <leader>s :split<return>
noremap <leader>v :vsplit<return>
" toggle invisible chars
nnoremap <leader>i :set list!<cr>
" fast edit/reload configs
nnoremap <leader><cr> :source $MYVIMRC<cr>
nnoremap <leader>evv  :edit   $MYVIMRC<cr>
nnoremap <leader>evm  :edit   $HOME/.config/nvim/mappings.vim<cr>
nnoremap <leader>evf  :edit   $HOME/.config/nvim/functions.vim<cr>
" C-a jumps to beginning in cmd mode (to match C-e)
" cnoremap <C-a> <Home>
" Switch between the last two files
nnoremap <C-Space> <C-^>
" Expand to current dir in cmd mode
cnoremap %% <C-r>=expand('%:h').'/'<cr>
" don't use Ex mode
map Q nop

" ==============================================
" #NAVIGATION {{{
" Disable arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk
" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv
" move lines
nnoremap J :m .+1<cr>==
nnoremap K :m .-2<cr>==
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
" Navigate splits
nmap <C-h>        <C-w>h
nmap <C-j>        <C-w>j
nmap <C-k>        <C-w>k
nmap <C-l>        <C-w>l
tmap <C-h>        <C-\><C-N><C-w>h
tmap <C-j>        <C-\><C-N><C-w>j
tmap <C-k>        <C-\><C-N><C-w>k
tmap <C-l>        <C-\><C-N><C-w>l
nmap <C-Left>     <C-w>h
nmap <C-Down>     <C-w>j
nmap <C-Up>       <C-w>k
nmap <C-Right>    <C-w>l
" Move splits
" nnoremap <A-h>    <C-w>H
" nnoremap <A-j>    <C-w>J
" nnoremap <A-k>    <C-w>K
" nnoremap <A-l>    <C-w>L
" Resize splits
let g:resize_disable_mappings = 1
nnoremap <silent> <A-Up>     :ResizeUp<Cr>
nnoremap <silent> <A-Down>   :ResizeDown<Cr>
nnoremap <silent> <A-Left>   :ResizeLeft<Cr>
nnoremap <silent> <A-Right>  :ResizeRight<Cr>
nnoremap <silent> <A-=>      <C-w>=<Cr>
" Page up - page down without moving cursor
nnoremap <silent> <PageUp>   <C-U><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageUp>   <C-U><C-U>
vnoremap <silent> <PageDown> <C-D><C-D>
" }}}


" Split line at cursor
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<cr>
" Substitution
nnoremap <C-s> :%s/<C-r><C-w>/

" Diff window
" Navigate previous/next change
if &diff
  map ] ]c
  map [ [c
endif

" Commentary
nnoremap <leader>/  :Commentary<cr>
vnoremap <leader>/  :Commentary<cr>

" ==============================================
" #FZF {{{
nnoremap <leader><leader> :Buffers<cr>
nnoremap <C-p>      :Files<cr>
nnoremap <C-g>      :GFiles<cr>
" Find word under cursor using Rg
nnoremap <C-f>      :Rg <C-r><C-w><cr>
nnoremap <leader>rg :Rg <C-r><C-w><cr>
" Find & replace word under cursor
nnoremap <leader>fr :%s/<C-r><C-w>/

let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-t': 'tab split'
  \}
" }}}


" ==============================================
" #FUGITIVE {{{
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
" }}}


" ==============================================
" #GV.VIM {{{
nmap <leader>gl :GV<cr>
" }}}


" ==============================================
" #SIGNIFY {{{
" Only Git
let g:signify_vcs_list = [ 'git' ]
" Jump to next and previous hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" Hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
" }}}


" ==============================================
" #FUNCTION KEYS {{{
" Grep word under cursor with F3
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<cr>
" Switch header / source .c*,.h*
map <F5> :call CHeaderToggle()<cr>
" Call make
map <F9> :make!<cr>
" Floating terminal
let g:floaterm_keymap_toggle = '<F12>'
"let g:floaterm_keymap_new    =
"let g:floaterm_keymap_prev   =
"let g:floaterm_keymap_next   =
" }}}


