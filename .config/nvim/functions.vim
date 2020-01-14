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

