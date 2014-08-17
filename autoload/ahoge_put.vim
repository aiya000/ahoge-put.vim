scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

"-=-=-=-=-=-=-=-=-=-"

" Load Variables {{{

let g:ahoge_put_sections = get(g:, 'ahoge_put_sections', {})

let g:ahoge_put_sections.fst = get(g:ahoge_put_sections, 'fst', [
\	'ゆかりさんは',
\	'マキさんは'
\])
let g:ahoge_put_sections.snd = get(g:ahoge_put_sections, 'snd', [
\	'ぺったんこな',
\	'粘土をよく食べる'
\])
let g:ahoge_put_sections.thd = get(g:ahoge_put_sections, 'thd', [
\	'爆発狂だ',
\	'ギター担当だ'
\])

" }}}

" Functions {{{

function! ahoge_put#put()
	let l:fst = s:select_item(g:ahoge_put_sections['fst'])
	let l:snd = s:select_item(g:ahoge_put_sections['snd'])
	let l:thd = s:select_item(g:ahoge_put_sections['thd'])

	let l:b = @+
	let @+ = l:fst . l:snd . l:thd
	execute 'normal "+p'
	let @+ = l:b
endfunction

function! s:select_item(itemList)
	let l:matchEnd = matchend(reltimestr(reltime()), '\d\+\.') + 1
	let rand = reltimestr(reltime())[l:matchEnd :]
	\          % (len(a:itemList)-1 + 1)

	return a:itemList[rand]
endfunction

" }}}

"-=-=-=-=-=-=-=-=-=-"
let &cpo = s:save_cpo
unlet s:save_cpo

"vim: fdm=marker
