# vim-pair-file-open
ファイルパターンの組み合わせを登録しておくことで、対応するファイルを瞬時に開くことができるvimプラグインです。

## 用語集
targetFile: 本機能が有効なファイル。targetFileを開いている状態でのみ機能する。
pairFile: targetFileに対応して開くpairFile。

## 使い方
1. .vimrc や init.vim　を開く
2. ```g:vim_pair_file_open#pair```を定義する

```
" init.vim
let g:vim_pair_file_open#pair = { "*Screen.js": "*ScreenContainer.js", "*ScreenContainer.js": "*Screen.js" }
```
* HogeHogeScreen.jsを開いているとき、同じ階層にあるHogeHogeScreenContainer.jsを開く
* HogeHogeScreenContainer.jsを開いているとき、同じ階層にあるHogeHogeScreen.jsを開く


3. コマンド```:Psp``` or ```:Pvsp``` or ```:Pedit```を叩く

## g:vim_pair_file_open#pair
辞書型
```{ targetFilePattern: pairFilePattern, ... }```
