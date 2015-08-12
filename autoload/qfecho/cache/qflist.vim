scriptencoding utf-8

function! qfecho#cache#qflist#save() abort
  call qfecho#cache#qflist#clear()
  call qfecho#cache_util#add(s:qfcache, getqflist())
endfunction

function! qfecho#cache#qflist#clear() abort
  let s:qfcache = {}
endfunction

function! qfecho#cache#qflist#get() abort
  return s:qfcache
endfunction

call qfecho#cache#qflist#clear()

