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

## エンコーディング宣言

UTF-8を文字エンコードとして使用する場合、エンコーディング宣言を書くべきではないと、PEP8には書かれている[^1]ので、通常はエンコーディング宣言を書く必要はありません。

```python
# coding: UTF-8
```

```python
# -*- coding: utf-8 -*-    # emacsに自動認識させるための書式
```

[^1]: [ソースファイルのエンコーディング - pep8-ja](https://pep8-ja.readthedocs.io/ja/latest/#section-9)

## 型アノテーション

型ヒントの書き方については[typing --- 型ヒントのサポート](https://docs.python.org/ja/3/library/typing.html#module-contents)を参照してください。

## `if __name__ == "__main__"`

Pythonファイルの末尾には、そのPythonファイルがコマンドラインからスクリプトとして実行されたときに行う処理を記述してください。

通常、他のPythonスクリプトから`import`されると、`import`されたモジュールの`__name__`属性にはモジュール名が格納されますが、シェルから`import`された場合、`__name__`属性には`__main__`という文字列が格納されます。そのため、`if __name__ == "__main__"`に書かれた処理はシェルから呼び出されたときにのみ実行されます。

```python
if __name__ == "__main__":
    pass
```

## VSCode拡張機能

### autoDocstring

クラスやメソッドを書き終わったあと、宣言文の下にクオーテーションを３つ入力し、`Enter`を押すと、Docstringを自動生成できます。

Docstringのスタイルについては[autoDocstring - Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring#:~:text=and%20parameter%20types-,Docstring%20Formats,-To%20turn%20off)を参照。ここでは、Docstringのスタイルに`google`を選択している。

以下は、アンダーバー（`_ _`）で囲まれている部分はプレースホルダーです。

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
