# Pyright

mypyと同じ静的型チェックツール。マイクロソフトがVSCode拡張機能として開発したもので、同じくVSCode拡張機能のPylanceにデフォルトで組み込まれている。mypyよりも５倍高速だとマイクロソフトは言っている。

## Tips

### `Stub file not found`

サードパーティ製のライブラリを`import`した際に、Pylance（Pyright）に`Stub file not found`と言われた場合は、該当のコードに表示される電球マークをクリックし、`Create Type Stub For "xxx"`を選択することでスタブファイルを自動生成すると、`Stub file not found`を解決することができる（[参照](https://github.com/microsoft/pyright/issues/524)）。
