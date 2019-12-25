# vim-pair-file-open
ファイルパターンの組み合わせを登録しておくことで、対応するファイルを瞬時に開くことができるvimプラグインです。

## 用語集
* targetFile
  * 本機能が有効なファイル
  * targetFileを開いている状態でのみ機能する
* pairFile
  * 本機能で開くファイル

## 使い方
1. .vimrc や init.vim　を開く
2. ```g:vim_pair_file_open#pair```を定義する

```
" init.vim
let g:vim_pair_file_open#pair = {
  \ '*Screen.js': '*ScreenContainer.js',
  \ '*ScreenContainer.js': '*Screen.js',
  \ '*Redux.js': '../Sagas/*Sagas.js',
  \ '*Sagas.js': '../Redux/*Redux.js',
  \ }
```
* HogeScreen.jsを開いているとき、同じ階層にあるHogeScreenContainer.jsを開く
* HogeScreenContainer.jsを開いているとき、同じ階層にあるHogeScreen.jsを開く
* HogeRedux.jsを開いているとき、HogeRedux.jsのある階層から辿って、../Sagas/HogeSagas.jsを開く
* HogeSagas.jsを開いているとき、HogeSagas.jsのある階層から辿って、../Redux/HogeRedux.jsを開く

3. コマンド```:Psp``` or ```:Pvsp``` or ```:Pedit```を叩く

## g:vim_pair_file_open#pair
辞書型
```{ targetFilePattern: pairFilePattern, ... }```
