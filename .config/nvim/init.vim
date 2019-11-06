" To start vim without using this .vimrc file, use:
"     vim -u NORC
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings.
" This setting must be as early as possible, as it has side effects.
set nocompatible
let mapleader = ","

if has('autocmd')
  filetype plugin indent on
endif

" ==============================================
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/mappings.vim
" ==============================================


" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
au FocusLost * :wa

"
" Relative numbering
" Toggle relative numbering, and set to absolute on loss of focus or insert mode
"
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

"
" Ripgrep
"
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  " rg command
  let g:rg_cmd = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '
  command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_cmd .shellescape(<q-args>), 1, <bang>0)

endif

"
" NERDTree
"
" close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" VimWiki
"
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

"
" Deoplete
"
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-4.0/lib/libclang-4.0.so'

"
" Denite
" 
" Change file_rec command.
"call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
"call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])
"call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
"call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'final_opts', [])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])

"
" COC
"
"let g:coc_global_extensions = 

" Auto load local vim settings from .vimlocal files
"silent! so .vimlocal

