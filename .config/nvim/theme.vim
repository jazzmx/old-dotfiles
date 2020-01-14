"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
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
"if !has('gui_running')
"  set t_Co=256
"endif


set background=dark
colorscheme gruvbox8_hard
set guifont=Inconsolata\ Nerd\ Font\ Complete\ Mono\ 11
"hi CursorLine ctermbg=Black guibg=#161616

"
" Gruvbox8 options
"
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_transp_bg = 0

" lightline
let g:lightline = { 'colorscheme': 'jellybeans' }

" Tmuxline
"let g:tmuxline_theme = 'iceberg'
"let g:tmuxline_preset = 'nightly_fox'

" FZF
let g:fzf_colors = {
  \ 'fg':      ['fg', 'GruvboxGray'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'GruvboxRed'],
  \ 'fg+':     ['fg', 'GruvboxGreen'],
  \ 'bg+':     ['bg', 'GruvboxBg1'],
  \ 'hl+':     ['fg', 'GruvboxRed'],
  \ 'info':    ['fg', 'GruvboxOrange'],
  \ 'prompt':  ['fg', 'GruvboxBlue'],
  \ 'header':  ['fg', 'GruvboxBlue'],
  \ 'pointer': ['fg', 'Error'],
  \ 'marker':  ['fg', 'Error'],
  \ 'spinner': ['fg', 'Statement'],
  \ }

