"  _     _
" / \__/| \
" | |\/|| |      Maxime Langlois
" | |  || |_/\
" \_/  \|____/   https://github.com/mxlang
"
" ==========================================
"
" To start vim without using this .vimrc file, use:
"     vim -u NORC
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
" Type :so % to refresh .vimrc after making changes
"
" Profiling startup time
"     vim --startuptime vim-startup.log
"
" Open in debug mode:
"     vim -D file.txt
"  Debug a command
"     debug CommandName
"  Debug a fucntion
"     debug call FunctionName(arg)
"  Set verbose command
"     set verbose=9
"
" if v:progname == 'vi'
"   set noloadplugins
" endif

scriptencoding utf-8
" Specify python executable
" Avoid search, speeding up start-up.
if filereadable('/usr/local/bin/python3.6')
  let g:python3_host_prog = "/usr/local/bin/python3.6"
endif

command! Path :echo expand("%:p") 
cnoreabbrev path Path

" use_completion = ['coc','nvim-lsp']
let g:use_completion = 'nvim-lsp'

" wiki.vim
let g:wiki_root = '~/Documents/wiki'
let g:wiki_filetypes = ['wiki', 'md']
" Polyglot
let g:polyglot_disabled = ['autoindent']
" Editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" indent_blankline
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_buftype_exclude = ["terminal"]
" Vim DevIcons
let g:webdevicons_enable = 1
" Signify (Only Git)
let g:signify_vcs_list = [ 'git' ]
" vim-qf
let g:qf_mapping_ack_style = 1
let g:winresizer_vert_resize = 3
" lf.vim
let g:lf_replace_netrw = 1
"-----------------------------------------
" PLUGINS
"----------------------------------------- 
source $HOME/.config/nvim/plugins.vim
" lua require('plugins')
"-----------------------------------------
"-----------------------------------------
"-----------------------------------------


if has('termguicolors')
   set termguicolors
endif

" Enable this after loading plugins
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" After this file is sourced, plugin code will be evaluated (./plugin)
" See ./after for files evaluated after that.
" See `:scriptnames` for a list of all scripts, in evaluation order.
" Launch Vim with `vim --startuptime vim.log` for profiling info.

