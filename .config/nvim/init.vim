" To start vim without using this .vimrc file, use:
"     vim -u NORC
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings.
" This setting must be as early as possible, as it has side effects.
set nocompatible
let g:python3_host_prog = "/usr/local/bin/python3.6"

" https://wiki.archlinux.org/index.php/Tmux

" ==============================================
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/sensible.vim
" after/plugins
" $HOME/.config/nvim/after/plugin/coc.vim
" ==============================================

augroup vimrc
   autocmd!
augroup END

" Autoread when changing buffers or coming back to vim
autocmd vimrc FocusGained,BufEnter * silent! !
" Move to the directory each buffer
autocmd vimrc BufEnter * silent! lcd %:p:h
" Reload vimrc on vim config changes
autocmd vimrc bufwritepost {.vimrc,*.vim} source $MYVIMRC | echom "... vimrc reloaded!"
" File types which uses real tabs
autocmd vimrc FileType {make,gitconfig,go} setl noexpandtab
" Open quickfix window automatically
autocmd vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
autocmd vimrc QuickfixCmdPost l* nested lopen | wincmd p
" Close quickfix window when it is the only window
autocmd vimrc WinEnter * if &l:buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif

let g:vim_vue_plugin_load_full_syntax = 1

" ==============================================
" #PEAR-TREE {{{
if exists('g:loaded_pear_tree')
  " Pair expansion is dot-repeatable by default:
  let g:pear_tree_repeatable_expand = 0
  let g:pear_tree_smart_openers = 1
  let g:pear_tree_smart_closers = 1
endif
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
" #FLOATERM {{{
" if exists('g:loaded_floaterm')
let g:floaterm_position = 'center'
" Set border color & window background when focus lost
hi FloatermBorder guibg=Gray12
hi FloatermNC guibg=Gray30
" remap navigation controls inside floaterm window
autocmd vimrc FileType floaterm tnoremap <buffer> <C-t> <C-\><C-n>:FloatermToggle<cr>
autocmd vimrc FileType floaterm tnoremap <buffer> <C-n> <C-\><C-n>:FloatermNew<cr>
autocmd vimrc FileType floaterm tnoremap <buffer> <C-j> <C-\><C-n>:FloatermNext<cr>
autocmd vimrc FileType floaterm tnoremap <buffer> <C-k> <C-\><C-n>:FloatermPrev<cr>
" endif
"}}}

" ==============================================
" #FZF {{{
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6, 'border': 'rounded' } }
let g:fzf_preview_window = 'right:60%'
" Remap navigation inside fzf window
autocmd vimrc FileType fzf tnoremap <buffer> <C-j> <Down>
autocmd vimrc FileType fzf tnoremap <buffer> <C-k> <Up>
"}}}

" ==============================================
" #JSON {{{
autocmd vimrc FileType json syntax match Comment +\/\/.\+$+
"}}}

" ==============================================
" #C/CPP {{{
" Toggle source/header 
autocmd vimrc BufEnter *.c,*.h,*.cpp,*.hpp call CHeaderCurrentFile()
autocmd vimrc FileType c,cpp noremap <A-h> :call CHeaderToggle()<cr>
"}}}

" ==============================================
" #MARKDOWN {{{
autocmd vimrc BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
autocmd vimrc BufNewFile,BufRead *.md setlocal spell spelllang=en
"}}}

" ==============================================
" #EMMET {{{
if exists('g:loaded_emmet_vim')
  " activate emmet only on those file types
  let g:user_emmet_install_global = 0
  autocmd vimrc FileType html,css,vue EmmetInstall
endif
"}}}

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
" lua << END
"   local on_attach_vim = function()
"     require'completion'.on_attach()
"     require'diagnostic'.on_attach()
"   end
"   require'nvim_lsp'.bashls.setup{ on_attach=on_attach_vim }
"   require'nvim_lsp'.tsserver.setup{ on_attach=on_attach_vim }
"   require'nvim_lsp'.vuels.setup{ on_attach=on_attach_vim }
" END
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
" let g:completion_enable_snippet = 'UltiSnips'
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Manual triggering of completion menu
" inoremap <silent><expr> <c-p> completion#trigger_completion()
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

