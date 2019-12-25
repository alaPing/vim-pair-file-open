" 必要な宣言
if !exists("g:vim_pair_file_open#file_loaded")
  finish
endif
let g:vim_pair_file_open#file_loaded = 1

let s:save_cpo = &cpo
set cpo&vim
" 必要な宣言終わり


" ----- ここから本体 -----
" sample of g:vim_pair_file_open#pair
" { '*Screen.js': '*ScreenContainer.js', '*ScreenContainer.js': '*Screen.js', '*Redux.js': '../Sagas/*Sagas.js', '*Sagas.js': '../Redux/*Redux.js' }
function! pairfileopen#OpenPairFile(type)
  " 対になるファイルのパターンの組み合わせの設定を取得する
  if !exists('g:vim_pair_file_open#pair')
    echo 'g:vim_pair_file_open#pair is undefined. Please define it at .vimrc or init.vim or etc.'
    return
  endif
  let pair = g:vim_pair_file_open#pair

  " ターゲットファイル名を取得する
  let target_file_name = expand('%:t')
  let pair_file_path = ''

  for key in keys(pair)
    " ターゲットファイル名がkeyに一致するか調べる
    if stridx(target_file_name, substitute(key, '*', '', 'g')) >= 0
      " ターゲットファイル名とペアファイル名の共通部分を生成する
      let common_part = substitute(target_file_name, substitute(key, '*', '', 'g'), '', 'g')
      " ペアファイルのパスを生成する
      let pair_file_path = expand('%:p:h') . '/' . substitute(pair[key], '*', common_part, 'g')
    endif
  endfor

  " ペアファイルのパスが生成できていなければ抜ける
  if pair_file_path == ''
    echo 'NOT FOUND'
    return
  endif

  " 画面分割で開く
  if a:type == 'sp'
    execute 'split ' . pair_file_path
  elseif a:type == 'vsp'
    execute 'vsplit ' . pair_file_path
  else
    execute 'edit ' . pair_file_path
  end
endfunction

" ----- ここまで本体 ----- '


" 必要な宣言
let &cpo = s:save_cpo
unlet s:save_cpo
" 必要な宣言終わり
