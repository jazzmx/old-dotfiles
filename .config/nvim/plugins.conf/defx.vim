
" ==============================================
" #DEFX {{{
if exists('g:loaded_defx')
  " Close defx if only buffer left in the window
  autocmd WinEnter * if &ft == 'defx' && winnr('$') == 1 | q | endif

  call defx#custom#option('_', {
    \ 'columns': 'indent:git:icons:filename',
    \ 'winwidth': 30,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 0,
    \ 'toggle': 1,
    \ 'resume': 1,
    \ })

  let g:defx_git#indicators = {
    \ 'Modified'  : '•',
    \ 'Staged'    : '✚',
    \ 'Untracked' : 'ᵁ',
    \ 'Renamed'   : '≫',
    \ 'Unmerged'  : '≠',
    \ 'Ignored'   : 'ⁱ',
    \ 'Deleted'   : '✖',
    \ 'Unknown'   : '⁇'
    \ }

  " Toggle show/hide tree
  nnoremap <silent> <C-n> :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>

  " Mappings
  autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <Cr>
          \ defx#is_directory() ?
          \ defx#do_action('open_directory') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> o
          \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> s
          \ defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> v
          \ defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> t
          \ defx#do_action('drop', 'tabedit')
    nnoremap <silent><buffer><expr> P
          \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> yp
          \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> yy
          \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> dd
          \ defx#do_action('move')
    nnoremap <silent><buffer><expr> pp
          \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> r
          \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> md
          \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> mf
          \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> C
          \ defx#do_action('toggle_columns',
          \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
          \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> D
          \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> !
          \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
          \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> .
          \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ~
          \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
          \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
          \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
          \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> h
          \ defx#is_directory() ?
          \   defx#is_opened_tree() ?
          \     defx#do_action('close_tree') : defx#do_action('cd', ['..'])
          \ : defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> j
          \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
          \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> l
          \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> <Left>
          \ defx#is_directory() ?
          \   defx#is_opened_tree() ?
          \     defx#do_action('close_tree') : defx#do_action('cd', ['..'])
          \ : defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> <Right>
          \ defx#is_directory() ?
          \ defx#do_action('open_or_close_tree') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> cd
          \ defx#do_action('change_vim_cwd')
    nnoremap <silent><buffer><expr> R
          \ defx#do_action('redraw')
  endfunction

endif
"}}}

