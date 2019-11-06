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
if !has('gui_running')
  set t_Co=256
endif


colorscheme gruvbox
set background=dark
set guifont=Inconsolata\ Nerd\ Font\ Complete\ Mono\ 11
hi CursorLine ctermbg=Black guibg=#161616

" lightline
let g:lightline = { 'colorscheme': 'wombat' }

" Tmuxline
let g:tmuxline_theme = 'iceberg'
let g:tmuxline_preset = 'nightly_fox'

