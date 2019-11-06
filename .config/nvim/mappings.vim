" Disable highlight with esc
nnoremap <esc> :noh<return><esc>
" Quickly edit/reload vimrc
vnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>rv :so $MYVIMRC<CR>

" ==============================================
" Navigation {{{
"
" Disable arrow keys
"nnoremap <up>    <nop>
"nnoremap <down>  <nop>
"nnoremap <left>  <nop>
"nnoremap <right> <nop>
"inoremap <up>    <nop>
"inoremap <down>  <nop>
"inoremap <left>  <nop>
"inoremap <right> <nop>
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
nnoremap <silent> <PageUp>   <C-U><C-U>
vnoremap <silent> <PageUp>   <C-U><C-U>
inoremap <silent> <PageUp>   <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>
" easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
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
" resize splits
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Move lines around easily
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Split line at cursor
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

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

if &diff
  map ] ]c
  map [ [c
endif

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


