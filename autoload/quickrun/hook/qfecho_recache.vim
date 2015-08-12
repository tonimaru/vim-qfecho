scriptencoding utf-8

let s:hook = {}
function! s:hook.on_exit(session, context) dict abort
  if a:session['config']['outputter'] ==# 'quickfix'
    silent call qfecho#cache#qflist#save()
  endif
endfunction

function! quickrun#hook#qfecho_recache#new() abort
	return copy(s:hook)
endfunction

