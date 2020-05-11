"
" Relative numbering
" Toggle relative numbering, and set to absolute on loss of focus or insert mode
"
set rnu
function! ToggleNumbersOn()
    set nonu
    set rnu
endfunction
function! ToggleRelativeOn()
    set nornu
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()


"
" FloatingWindowCentered
" Creates a floating window with a most recent buffer to be used
function! FloatingWindowCentered()
  " 60% of the height
  let height = float2nr(&lines * 0.6)
  " 60% of the width
  let width = float2nr(&columns * 0.6)
  " Vertical position
  let vpos = float2nr(((&lines - height) / 2) - 1)
  " Horizontal position
  let hpos = float2nr((&columns - width) / 2)

  let opts = {
    \ 'relative': 'editor',
    \ 'row': vpos,
    \ 'col': hpos,
    \ 'width': width,
    \ 'height': height
    \ }
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)
  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

" Function
" Export mapping to file
"
function ExportMappings(file)
   redir! > a:file
   silent verbose map
   redir END
endfunction

function! CHeaderCurrentFile()
  if exists("b:current_file")
    let b:previous_file = b:current_file
  endif

  if match(expand("%"), '\.c') > 0
    let b:current_file = substitute(".*\\\/" . expand("%:t"), '\.c\(.*\)', '.c[a-z]*', "")
  elseif match(expand("%"), "\\.h") > 0
    let b:current_file = substitute(".*\\\/" . expand("%:t"), '\.h\(.*\)', '.h[a-z]*', "")
  endif
endfun

function! CHeaderToggle()
  if match(expand("%"), '\.c') > 0
    let l:next_file = substitute(".*\\\/" . expand("%:t"), '\.c\(.*\)', '.h[a-z]*', "")
  elseif match(expand("%"), "\\.h") > 0
    let l:next_file = substitute(".*\\\/" . expand("%:t"), '\.h\(.*\)', '.c[a-z]*', "")
  endif

  if exists("b:previous_file") && b:previous_file == l:next_file
    e#
  else
    let l:directory_name = fnamemodify(expand("%:p"), ":h")
    " At this point cmd might evaluate to something of the format:
    " /Users/person/ . -type f -iregex ".*\/test_class.h[a-z]*" -print -quit
    let l:cmd="find " . l:directory_name . " . -type f -iregex \""  . l:next_file . "\" -print -quit"

    " The substitute gets rid of the new line at the end of the result. The
    " function `filereadable` does not like the newline that `find` puts at
    " the end of the result and will not acknowledge that the file exists.
    let l:result = substitute(system(l:cmd), '\n', '', '')

    if filereadable(l:result)
      exe "e " l:result
    endif
  endif
endfun

" <Tab> indents if at the beginning of a line; otherwise does completion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-n>"
  endif
endfunction

