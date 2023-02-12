# Python

## シバン

シバンとは、シェルに対してそのファイルを何で実行すればいいかを伝えるものです。ファイルの１行目に`#! <PATH>`と書きます。

以下のようにPythonスクリプトに実行権限を渡し、ファイルの１行目にPython実行ファイルのパスを持つシバンを書くことで、Pythonスクリプトをファイルパスを指定するだけで実行できるようなります。Python実行ファイルのパスは`which python3`を実行することで表示できます。

環境によってPython実行ファイルのパスは異なりますので、特に必要なければ記述する必要はありません。

```bash
chmod +x <PYTHON_FILE_PATH>
```

```python
#! <PATH>
```

```bash
<PYTHON_FILE_PATH>
```

## 型アノテーション

型ヒントの書き方については[typing --- 型ヒントのサポート](https://docs.python.org/ja/3/library/typing.html#module-contents)を参照してください。

## `if __name__ == "__main__"`

Pythonファイルの末尾には、そのPythonファイルがコマンドラインからスクリプトとして実行されたときに行う処理を記述してください。

```python
if __name__ == "__main__":
    pass
```

## VSCode拡張機能

### autoDocstring

クラスやメソッドを書き終わったあと、宣言文の下にクオーテーションを３つ入力し、`Enter`を押すと、Docstringを自動生成できます。

Docstringのスタイルについては[autoDocstring - Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring#:~:text=and%20parameter%20types-,Docstring%20Formats,-To%20turn%20off)を参照。ここでは、Docstringのスタイルに`google`を選択している。

```python
# Google Docstring Format
def abc(a: int, c = [1,2]):
    """_summary_

    Args:
        a (int): _description_
        c (list, optional): _description_. Defaults to [1,2].

    Raises:
        AssertionError: _description_

    Returns:
        _type_: _description_
    """
    if a > 10:
        raise AssertionError("a is more than 10")

    return c
```
