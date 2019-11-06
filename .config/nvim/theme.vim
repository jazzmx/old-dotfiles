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
let g:airline_theme='hybrid'
let g:lightline = { 'colorscheme': 'wombat' }
hi CursorLine ctermbg=Black guibg=#161616
set guifont=Inconsolata\ Nerd\ Font\ Complete\ Mono\ 11

