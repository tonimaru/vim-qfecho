scriptencoding utf-8

function! s:get_cache_types() abort
  if !exists('s:cache_types')
    let s:cache_types = map(split(globpath(&runtimepath, 'autoload/qfecho/cache/*.vim'), "\n"), 'fnamemodify(v:val, '':t:r'')')
  endif
  return s:cache_types
endfunction

function! qfecho#cache#save() abort
  for type in s:get_cache_types()
    call qfecho#cache#{type}#save()
    unlet! type
  endfor
endfunction

function! s:get_cache_by_line(line) abort
  let caches = {}
  for type in s:get_cache_types()
    let cache = qfecho#cache#{type}#get()
    call extend(caches, get(cache, a:line, {}), 'force')
    unlet! cache
    unlet! type
  endfor
  return caches
endfunction

function! qfecho#cache#get_by_pos(line, col) abort
  let caches = s:get_cache_by_line(a:line)
  let cache_col = max(keys(filter(caches, 'v:key <= ' . a:col)))
  return get(caches, cache_col, '')
endfunction

