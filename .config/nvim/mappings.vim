" Quickly edit/reload vimrc
nnoremap <leader>ec  :vsplit  $MYVIMRC<CR>
nnoremap <leader>em  :vsplit  $HOME/.config/nvim/mappings.vim<CR>
nnoremap <leader>rc  :so $MYVIMRC<CR>
" Disable highlight with esc
nnoremap <esc> :noh<return><esc>
" Redo with U instead of Ctrl+R
nnoremap U <C-R>

" ==============================================
" #NAVIGATION {{{
" Disable arrow keys
if exists('g:disable_arrows')
  nnoremap <up>    <nop>
  nnoremap <down>  <nop>
  nnoremap <left>  <nop>
  nnoremap <right> <nop>
  inoremap <up>    <nop>
  inoremap <down>  <nop>
  inoremap <left>  <nop>
  inoremap <right> <nop>
endif
" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk
" Use tab to jump between bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" Page up - page down without moving cursor
nnoremap <silent> <PageUp>   <C-U><C-U>
vnoremap <silent> <PageUp>   <C-U><C-U>
inoremap <silent> <PageUp>   <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>
" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" move split
"nnoremap <A-H> <C-w>H
"nnoremap <A-J> <C-w>J
"nnoremap <A-K> <C-w>K
"nnoremap <A-L> <C-w>L
" Arrow variation
" move lines
nnoremap <A-Down>    :m .+1<CR>==
nnoremap <A-Up>      :m .-2<CR>==
inoremap <A-Down>    <Esc>:m .+1<CR>==gi
inoremap <A-Up>      <Esc>:m .-2<CR>==gi
vnoremap <A-Down>    :m '>+1<CR>gv=gv
vnoremap <A-Up>      :m '<-2<CR>gv=gv
" window navigation
nnoremap <C-Left>    <C-w>h
nnoremap <C-Down>    <C-w>j
nnoremap <C-Up>      <C-w>k
nnoremap <C-Right>   <C-w>l
" move split
nnoremap <C-S-Left>  <C-w>H
nnoremap <C-S-Down>  <C-w>J
nnoremap <C-S-Up>    <C-w>K
nnoremap <C-S-Right> <C-w>L
" }}}

" resize splits
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Split line at cursor
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<CR>
"nnoremap <leader>u :GundoToggle<CR>

" Diff window
" Navigate previous/next change
if &diff
  map ] ]c
  map [ [c
endif


" ==============================================
" #FZF {{{
nnoremap , :Buffers<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>rg :Rg <C-r><C-w><CR>
" Find & replace
nnoremap <leader>fr :%s/<C-r><C-w>/

nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
" Find word under cursor using Rg
nnoremap <C-f> :Rg <C-r><C-w><CR>
" Find & replace word under cursor
nnoremap <C-g> :%s/<C-r><C-w>/
" }}}


" ==============================================
" #FUGITIVE {{{
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
" nnoremap <leader>gc :Gcommit -v -q<CR>
" nnoremap <leader>ga :Git add %:p<CR><CR>
" nnoremap <leader>gt :Gcommit -v -q %:p<CR>
 nnoremap <leader>gd :Gdiff<CR>
" nnoremap <leader>ge :Gedit<CR>
" nnoremap <leader>gr :Gread<CR>
" nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <leader>gp :Ggrep<Space>
" nnoremap <leader>gm :Gmove<Space>
" nnoremap <leader>gb :Git branch<Space>
" nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Dispatch! git push<CR>
" nnoremap <leader>gpl :Dispatch! git pull<CR>
" }}}


" ==============================================
" #GV.VIM {{{
nmap <leader>gl :GV<CR>
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
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" Switch header / source .c*,.h*
map <F5> :call CurtineIncSw()<CR>
" Call make
map <F9> :make!<CR>
" Floating terminal
let g:floaterm_keymap_toggle = '<F12>'
"let g:floaterm_keymap_new    =
"let g:floaterm_keymap_prev   =
"let g:floaterm_keymap_next   =
" }}}


