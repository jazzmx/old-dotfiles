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
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
  nnoremap <C-g> :Rg<Cr>
endif


"
" FZF
"
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

"
" Tmuxline
"
let g:tmuxline_theme = 'iceberg'
let g:tmuxline_preset = 'nightly_fox'


" NERDTree
"
map <C-n> :NERDTreeToggle<CR>
" close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" VimWiki
"
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

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
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])

"
" COC
"
"let g:coc_global_extensions = 

" Auto load local vim settings from .vimlocal files
"silent! so .vimlocal

