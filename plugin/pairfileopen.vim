" 必要な宣言
if exists("g:loaded_pairfileopen")
  finish
endif
let g:loaded_pairfileopen = 1

let s:save_cpo = &cpo
set cpo&vim
" 必要な宣言終わり


" ----- ここから本体 ----- "
command! Psp call pairfileopen#OpenPairFile('sp')
command! Pvsp call pairfileopen#OpenPairFile('vsp')
command! Pedit call pairfileopen#OpenPairFile('edit')
" ----- ここまで本体 ----- "

" 必要な宣言
let &cpo = s:save_cpo
unlet s:save_cpo
" 必要な宣言終わり
