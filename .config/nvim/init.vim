" To start vim without using this .vimrc file, use:
"     vim -u NORC
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings.
" This setting must be as early as possible, as it has side effects.
set nocompatible
nnoremap ; :
let mapleader = "'"
" let g:disable_arrows = 1
let g:python3_host_prog = "/usr/local/bin/python3.6"

" ==============================================
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/coc.vim
" ==============================================

" Autoread triggered when changing buffers
" or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
au FocusLost * :wa


" ==============================================
" #NETRW {{{
" Set preferred view
let g:netrw_liststyle = 3
" Remove banner
let g:netrw_banner = 0
" }}}


" ==============================================
" #RIPGREP {{{
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:rgcmd = 'rg --column --line-number --no-heading --color=always --smart-case --no-ignore --hidden --follow --glob "!.git/*" '
  command! -bang -nargs=* Rg call fzf#vim#grep( g:rgcmd .shellescape(<q-args>), 1, <bang>0)
  "command! -bang -nargs=* Rg call fzf#vim#grep( g:rgcmd .shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
endif
"}}}


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

endif
"}}}


" ==============================================
" #MARKDOWN {{{
" let g:pencil#textwidth = 80
" let g:vim_markdown_folding_disabled = 1
" let g:markdown_fenced_languages = ['rust', 'css', 'yaml', 'javascript', 'html', 'vim','json']
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en
" augroup pencil
"   autocmd!
"   autocmd FileType md call pencil#init()
" augroup END
"}}}


" ==============================================
" #COC {{{
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"}}}


" ==============================================
" #VIMWIKI {{{
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
"}}}


" ==============================================
" #FZF {{{
" Reverse the layout to make the FZF list top-down
"let $FZF_DEFAULT_OPTS='--layout=reverse'
" Using the custom window creation function
"let g:fzf_layout = { 'window': 'call FloatingWindowCentered()' }
"}}}

