" 必要な宣言
if exists("g:vim_pair_file_open#file_loaded") && !exists("g:vim_pair_file_open#pair")
  finish
endif
let g:vim_pair_file_open#file_loaded = 1

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
