scriptencoding utf-8

function! qfecho#cache#loclist#save() abort
  call qfecho#cache#loclist#clear()
  call qfecho#cache_util#add(b:qfecho_loclist_cache, getloclist(0))
endfunction

function! qfecho#cache#loclist#get() abort
  return get(b:, 'qfecho_loclist_cache', {})
endfunction

function! qfecho#cache#loclist#clear() abort
  let b:qfecho_loclist_cache = {}
endfunction

