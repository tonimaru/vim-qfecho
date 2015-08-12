scriptencoding utf-8

if get(g:, 'loaded_qfecho', 0)
  finish
endif
let g:loaded_qfecho = 1

let s:save_cpo=&cpo
set cpo&vim

let g:qfecho_enable_at_startup = get(g:, 'qfecho_enable_at_startup', 0)

command! -nargs=0 QfechoEnable call qfecho#enable()
command! -nargs=0 QfechoDisable call qfecho#disable()

if g:qfecho_enable_at_startup
  call qfecho#enable()
endif

let &cpo = s:save_cpo
unlet s:save_cpo

