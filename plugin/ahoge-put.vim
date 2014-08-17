
if exists('g:loaded_ahoge_vim')
	finish
endif
let g:loaded_ahoge_vim = 1
"-=-=-=-=-=-=-=-=-=-=-=-"

let s:save_cpo = &cpo
set cpo&vi

command! Ahoge call ahoge_put#put()

"-=-=-=-=-=-=-=-=-=-=-=-"
let &cpo = s:save_cpo
unlet s:save_cpo
