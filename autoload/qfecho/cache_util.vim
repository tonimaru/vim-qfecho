scriptencoding utf-8

function! s:add_cache(caches, obj) abort
  let lnum = a:obj['lnum']
  let col = a:obj['col']
  let text = a:obj['text']

  let a:caches[lnum] = get(a:caches, lnum, {})
  let a:caches[lnum][col] = text
endfunction

function! qfecho#cache_util#add(caches, list) abort
  for obj in a:list
    call s:add_cache(a:caches, obj)
    unlet! obj
  endfor
endfunction

