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

" Gruvbox options
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1

set background=dark
colorscheme gruvbox

set cursorline
hi CursorLine term=bold cterm=bold guibg=Gray8

if has("statusline") && !&cp
  set laststatus=2                      " always show the status bar
  set statusline=%<%1*\ %f\ %0*         " filename
  set statusline+=\ %m%r                " modified, readonly
  set statusline+=\ %y                  " filetype
  set statusline+=\ %{fugitive#head()}
  set statusline+=%=                    " left-right separation point
  set statusline+=\ %l/%L[%p%%]         " current line/total lines
  set statusline+=\ %v[0x%B]            " current column [hex char]
  " hi User1 ctermfg=0 ctermbg=6
endif

" lightline
let g:lightline = { 'colorscheme': 'gruvbox' }

" Tmuxline
"let g:tmuxline_theme = 'iceberg'
"let g:tmuxline_preset = 'nightly_fox'

" FZF
let g:fzf_colors = {
  \ 'fg':      ['fg', 'GruvboxGray'],
  \ 'bg':      ['bg', 'GruvboxBg0'],
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

