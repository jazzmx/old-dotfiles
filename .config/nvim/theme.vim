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

" Gruvbox options
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1

set background=dark
colorscheme gruvbox

set cursorline
highlight CursorLine term=bold cterm=bold guibg=Gray8
" Highlight 81st column on lines that reached it
highlight ColorColumn ctermbg=LightGray
call matchadd('ColorColumn', '\%81v', 100)

" lightline
let g:lightline = {
 \ 'colorscheme': 'gruvbox',
 \ 'active': {
 \   'left':  [ [ 'mode', 'filename' ],
 \              [ 'gitbranch' ] ],
 \   'right': [ [ 'lineinfo' ],
 \              [ 'percent' ],
 \              [ 'paste', 'fileformat', 'fileencoding', 'filetype' ] ]
 \ },
 \ 'inactive': {
 \   'left':  [ [ 'filename' ] ],
 \   'right': [ [ 'filetype' ] ]
 \ },
 \ 'component_function': {
 \   'filename': 'LightlineFilename',
 \   'readonly': 'LightlineReadonly',
 \   'gitbranch': 'LightlineGitBranch'
 \ },
 \ 'mode_map': {
 \ 'n' : 'N',
 \ 'i' : 'I',
 \ 'R' : 'R',
 \ 'v' : 'V',
 \ 'V' : 'VL',
 \ "\<C-v>": 'VB',
 \ 'c' : 'C',
 \ 's' : 'S',
 \ 'S' : 'SL',
 \ "\<C-s>": 'SB',
 \ 't': 'T',
 \ },
 \}

function! LightlineGitBranch()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help)' ? '' : ' '
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" Tmuxline
"let g:tmuxline_theme = 'iceberg'
"let g:tmuxline_preset = 'nightly_fox'

" FZF
let g:fzf_colors = {
  \ 'border':  ['fg', 'GruvboxGray'],
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

