" 必要な宣言
if !exists("g:loaded_pairfileopen")
  finish
endif
let g:loaded_pairfileopen = 1

let s:save_cpo = &cpo
set cpo&vim
" 必要な宣言終わり


" ----- ここから本体 ----- "
function! pairfileopen#OpenPairFile(type)
  " 対になるファイルのパターンの組み合わせの設定を取得する
  let pair = { "Screen.js": "ScreenContainer.js", "ScreenContainer.js": "Screen.js" }

  " いま開いているファイルの名前を取得する
  let filename = expand("%")
  let path = expand("%:p")
  let target_filename = ''

  " 対になるファイル名を生成する
  for key in keys(pair)
    if stridx(filename, key) == -1
      continue
    else
      let target_filename = substitute(filename, key, pair[key], "g")
    endif
  endfor

  " 対になるファイルが生成できなければ抜ける
  if target_filename == ''
    echo "NOT FOUND"
    return
  endif

  " 対になるファイルを探す
  " TODO:
  " 開いているファイルと同じディレクトリにあるファイルに決め打ちしてしまっている。
  " 大体の場所は特定できていることが多いと思われるので、
  " ファイルパスAのファイル <-> ファイルパスBのファイル
  " という紐付けができると良さそう。
  let target_path = substitute(path, filename, target_filename, "g")

  " 画面分割で開く
  if a:type == 'sp'
    execute "split " . target_path
  elseif a:type == 'vsp'
    execute "vsplit " . target_path
  else
    execute "edit " . target_path
  end
endfunction

" ----- ここまで本体 ----- "


" 必要な宣言
let &cpo = s:save_cpo
unlet s:save_cpo
" 必要な宣言終わり
