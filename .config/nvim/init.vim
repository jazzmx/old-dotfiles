" To start vim without using this .vimrc file, use:
"     vim -u NORC
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings.
" This setting must be as early as possible, as it has side effects.
set nocompatible
let g:python3_host_prog = "/usr/local/bin/python3.6"

" ==============================================
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/mappings.vim
" ==============================================

" Autoread when changing buffers or coming back to vim
autocmd FocusGained,BufEnter * :silent! !
" Autosave when losing focus
autocmd FocusLost * :wa
" Reload vimrc on vim config changes
autocmd! bufwritepost {.vimrc,*.vim} source $MYVIMRC
" File types which uses real tabs
autocmd FileType {make,gitconfig,go} setl noexpandtab

" ==============================================
" #NETRW {{{
let g:netrw_liststyle = 3
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
" #FZF {{{
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded' } }
let g:fzf_preview_window = 'right:60%'
" Remap Ctrl-j/k to up/down in fzf
autocmd FileType fzf tnoremap <buffer> <C-j> <Down>
autocmd FileType fzf tnoremap <buffer> <C-k> <Up>
"}}}

" ==============================================
" #JSON {{{
autocmd FileType json syntax match Comment +\/\/.\+$+
"}}}

" ==============================================
" #C/CPP {{{
" Toggle source/header 
autocmd BufEnter *.c,*.h,*.cpp,*.hpp call CHeaderCurrentFile()
"}}}

" ==============================================
" #MARKDOWN {{{
" let g:markdown_fenced_languages = ['rust', 'css', 'yaml', 'javascript', 'html', 'vim','json']
autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en
"}}}

" ==============================================
" #EMMET {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall
"}}}

let g:vim_vue_plugin_load_full_syntax = 1
let g:floaterm_position = 'center'

" ==============================================
" #VIMWIKI {{{
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
"}}}

" ==============================================
" #ULTISNIPS {{{
" let g:UltiSnipsExpandTrigger="<A-l>"
" let g:UltiSnipsJumpForwardTrigger="<A-j>"
" let g:UltiSnipsJumpBackwardTrigger="<A-k>"
"}}}

" ==============================================
" #NVIM-LSP {{{
lua << END
  local on_attach_vim = function()
    require'completion'.on_attach()
    require'diagnostic'.on_attach()
  end
  require'nvim_lsp'.bashls.setup{ on_attach=on_attach_vim }
  require'nvim_lsp'.tsserver.setup{ on_attach=on_attach_vim }
  require'nvim_lsp'.vuels.setup{ on_attach=on_attach_vim }
END
" sign define LspDiagnosticsErrorSign text=✖
" sign define LspDiagnosticsWarningSign text=⚠
" sign define LspDiagnosticsInformationSign text=ℹ
" sign define LspDiagnosticsHintSign text=➤
"}}}

" Insert tab in start of line, else use for completion
" inoremap  =InsertTabWrapper()
" inoremap  

" ==============================================
" #COMPLETION-NVIM {{{
let g:completion_enable_snippet = 'UltiSnips'
" Use  and  to navigate through popup menu
inoremap     pumvisible() ? "\" : "\"
inoremap   pumvisible() ? "\" : "\"
" Manual triggering of completion menu
inoremap   completion#trigger_completion()
"}}}

" ==============================================
" #DEOPLETE {{{
" deoplete tab-complete
" let g:AutoPairsMapCR=0
" imap    pumvisible()? '\' : '\'
" imap  pumvisible()? '\' : '\'
" imap     pumvisible()? deoplete#close_popup() : '\\AutoPairsReturn'
" completion sources
" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})
"}}}

