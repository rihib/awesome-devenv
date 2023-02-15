# Jupyter

VSCode内でJupyter Notebooksを使うことができます。

## セットアップ

### Jupyterパッケージをインストールする

以下のコマンドでJupyterパッケージをインストールします。

```bash
poetry add jupyter
```

### `ipynb`拡張子を持つファイルを作成する

任意の名前を持つ`ipynb`ファイルを作成すると、VSCode内でJupyter Notebooksを使用できます。

## 使用方法

[Jupyter Notebooks in VS Code](https://code.visualstudio.com/docs/datascience/jupyter-notebooks)を参照してください。

## Tips

### `Output exceeds the size limit. Open the full output data in a text editor`

デフォルトでは30行までしか表示されないので、`.vscode/settings.json`に`"notebook.output.textLineLimit": 300,`などと追記してください。
