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

### GoogleスタイルのDocstring

クラスやメソッドを書き終わったあと、宣言文の下にクオーテーションを３つ入力し、`Enter`を押すと、Docstringを自動生成できます。自動生成されるDocstringのスタイルについては[autoDocstring - Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring#:~:text=and%20parameter%20types-,Docstring%20Formats,-To%20turn%20off)を参照してください。

具体的な書き方については[Comments and Docstrings - Google Python Style Guide](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings)を参照してください。

```python
# Google Docstring Format
"""A one line summary of the module or program, terminated by a period.

Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.

Typical usage example:

  foo = ClassFoo()
  bar = foo.FunctionBar()
"""

import example


class SampleClass:
    """Summary of class here.

    Longer class information...
    Longer class information...

    Attributes:
        likes_spam: A boolean indicating if we like SPAM or not.
        eggs: An integer count of the eggs we have laid.
    """

    def __init__(self, likes_spam: bool = False):
        """Inits SampleClass with blah."""
        self.likes_spam = likes_spam
        self.eggs = 0

    def fetch_smalltable_rows(table_handle: smalltable.Table,
                            keys: Sequence[Union[bytes, str]],
                            require_all_keys: bool = False,
        ) -> Mapping[bytes, tuple[str, ...]]:
        """Fetches rows from a Smalltable.

        Retrieves rows pertaining to the given keys from the Table instance
        represented by table_handle.  String keys will be UTF-8 encoded.

        Args:
            table_handle:
                An open smalltable.Table instance.
            keys:
                A sequence of strings representing the key of each table row to
                fetch.  String keys will be UTF-8 encoded.
            require_all_keys:
                If True only rows with values set for all keys will be returned.

        Returns:
            A dict mapping keys to the corresponding table row data
            fetched. Each row is represented as a tuple of strings. For
            example:

            {b'Serak': ('Rigel VII', 'Preparer'),
            b'Zim': ('Irk', 'Invader'),
            b'Lrrr': ('Omicron Persei 8', 'Emperor')}

            Returned keys are always bytes.  If a key from the keys argument is
            missing from the dictionary, then that row was not found in the
            table (and require_all_keys must have been False).

        Raises:
            IOError: An error occurred accessing the smalltable.
        """
```
