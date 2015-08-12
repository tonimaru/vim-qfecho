scriptencoding utf-8

let s:is_cmdwin_leaved = 0

function! qfecho#enable() abort
  augroup qfecho
    autocmd!
    autocmd QuickFixCmdPost [^l]* call qfecho#cache#qflist#save()
    autocmd QuickFixCmdPost l* call qfecho#cache#loclist#save()
    autocmd CmdwinLeave * let s:is_cmdwin_leaved = 1
    autocmd CursorMoved * call qfecho#show()
  augroup END
  call qfecho#cache#save()
endfunction

function! qfecho#disable() abort
  autocmd! qfecho
  let s:is_cmdwin_leaved = 0
endfunction

function! qfecho#show() abort
  if s:is_cmdwin_leaved == 1
    let s:is_cmdwin_leaved = 0
    return
  endif
  let line = line('.')
  let col = col('.')
  let text = qfecho#cache#get_by_pos(line, col)
  echo text
endfunction

