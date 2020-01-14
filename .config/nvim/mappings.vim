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
" #COC {{{
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
nmap <C-n> :CocCommand explorer
    \ --toggle
    \ --sources=file+
    \ --file-columns=git:selection:clip:diagnosticError:indent:icon:filename;fullpath;size;modified;readonly<CR>
"}}}


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


" " ==============================================
" " #DEFX {{{
" " Toggle show/hide tree
" nnoremap <silent> <C-n> :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
" " DEFX mappings
" autocmd FileType defx call s:defx_my_settings()
" function! s:defx_my_settings() abort
"   nnoremap <silent><buffer><expr> <Cr>
"   \ defx#is_directory() ?
"   \ defx#do_action('open_directory') : defx#do_action('drop')
"   nnoremap <silent><buffer><expr> o
"   \ defx#do_action('drop')
"   nnoremap <silent><buffer><expr> s
"   \ defx#do_action('drop', 'split')
"   nnoremap <silent><buffer><expr> v
"   \ defx#do_action('drop', 'vsplit')
"   nnoremap <silent><buffer><expr> t
"   \ defx#do_action('drop', 'tabedit')
"   nnoremap <silent><buffer><expr> P
"   \ defx#do_action('open', 'pedit')
"   nnoremap <silent><buffer><expr> yp
"   \ defx#do_action('yank_path')
"   nnoremap <silent><buffer><expr> yy
"   \ defx#do_action('copy')
"   nnoremap <silent><buffer><expr> dd
"   \ defx#do_action('move')
"   nnoremap <silent><buffer><expr> pp
"   \ defx#do_action('paste')
"   nnoremap <silent><buffer><expr> r
"   \ defx#do_action('rename')
"   nnoremap <silent><buffer><expr> md
"   \ defx#do_action('new_directory')
"   nnoremap <silent><buffer><expr> mf
"   \ defx#do_action('new_file')
"   nnoremap <silent><buffer><expr> C
"   \ defx#do_action('toggle_columns',
"   \                'mark:indent:icon:filename:type:size:time')
"   nnoremap <silent><buffer><expr> S
"   \ defx#do_action('toggle_sort', 'time')
"   nnoremap <silent><buffer><expr> D
"   \ defx#do_action('remove')
"   nnoremap <silent><buffer><expr> !
"   \ defx#do_action('execute_command')
"   nnoremap <silent><buffer><expr> x
"   \ defx#do_action('execute_system')
"   nnoremap <silent><buffer><expr> .
"   \ defx#do_action('toggle_ignored_files')
"   nnoremap <silent><buffer><expr> ~
"   \ defx#do_action('cd')
"   nnoremap <silent><buffer><expr> q
"   \ defx#do_action('quit')
"   nnoremap <silent><buffer><expr> <Space>
"   \ defx#do_action('toggle_select') . 'j'
"   nnoremap <silent><buffer><expr> *
"   \ defx#do_action('toggle_select_all')
"   nnoremap <silent><buffer><expr> h
"   \ defx#is_directory() ?
"   \   defx#is_opened_tree() ?
"   \     defx#do_action('close_tree') : defx#do_action('cd', ['..'])
"   \ : defx#do_action('cd', ['..'])
"   nnoremap <silent><buffer><expr> j
"   \ line('.') == line('$') ? 'gg' : 'j'
"   nnoremap <silent><buffer><expr> k
"   \ line('.') == 1 ? 'G' : 'k'
"   nnoremap <silent><buffer><expr> l
"   \ defx#do_action('open_or_close_tree')
"   nnoremap <silent><buffer><expr> <Left>
"   \ defx#is_directory() ?
"   \   defx#is_opened_tree() ?
"   \     defx#do_action('close_tree') : defx#do_action('cd', ['..'])
"   \ : defx#do_action('cd', ['..'])
"   nnoremap <silent><buffer><expr> <Right>
"   \ defx#is_directory() ?
"   \ defx#do_action('open_or_close_tree') : defx#do_action('drop')
"   nnoremap <silent><buffer><expr> cd
"   \ defx#do_action('change_vim_cwd')
"   nnoremap <silent><buffer><expr> R
"   \ defx#do_action('redraw')
" endfunction
" " }}}

