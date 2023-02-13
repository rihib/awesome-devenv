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

## Docstring

ここではGoogleスタイルのDocstringについて説明します。他にもNumpyスタイルなどがあります。

クラスやメソッドを書き終わったあと、宣言文の下にクオーテーションを３つ入力し、`Enter`を押すと、Docstringを自動生成できます。自動生成されるDocstringのスタイルについては[autoDocstring - Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring#:~:text=and%20parameter%20types-,Docstring%20Formats,-To%20turn%20off)を参照してください。

以下の説明は、[Comments and Docstrings - Google Python Style Guide](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings)を参照しています。

### Docstringとは

Docstringは、そのモジュール・関数・クラスを呼び出して使用する人が、コードを見なくても、呼び出して使用できるようにするためのものです。コードを読みやすくするためのものではないことに注意してください。なので、呼び出して使用するのに必要な最低限の説明だけあれば十分で、それ以上の実装の詳細などを記述する必要はありません。

### 書き方

- [ ] 常に３つのダブルクオートを使用[^2]
- [ ] 一番最初の行に１行に収まる要約を書く
- [ ] 要約のあとに空白行を１つ挟んでからより詳細な説明を記述する
- [ ] 断片的な文章ではなく、物語のテキストと同じように読みやすい完全な文章にする
- [ ] スタイルに一貫性を持たせる

[^2]: [PEP 257 – Docstring Conventions](https://peps.python.org/pep-0257/#:~:text=always%20use%20%22%22%22triple%20double%20quotes%22%22%22%20around%20docstrings)

#### モジュール

- [ ] 必須
- [ ] ファイルの先頭（import文よりも前）に書く
- [ ] モジュールの内容と使用方法を記述する
- [ ] すべてのファイルに、プロジェクトで使用されているライセンスの定型文を含める必要がある

```python
"""モジュールまたはプログラムの概要を1行で記述し、句点またはピリオドで終了させる。

空白行を１つ挟むこと。 このDocstringの残りの部分は、モジュールやプログラムの全体的な説明を含む必要がある。
オプションとして、`export`されたクラスや関数の簡単な説明や使用例を含めることもできる。

典型的な使用例：

    foo = ClassFoo()
    bar = foo.FunctionBar()
"""
```

##### テストモジュール

- [ ] テストファイルには、モジュールレベルのDocstringは必要がなければ書かなくていい
- [ ] 追加で提供できる情報（テストの実行方法に関する詳細な説明、 珍しい設定パターン、外部環境への依存性など）がある場合にのみ記述する
- [ ] すでに自明な情報は記述しないこと

```python
"""このblazeテストはgoldenファイルを使用する。

`google3`ディレクトリの`blaze run //foo/bar:foo_test -- --update_golden_files`を実行することで、goldenファイルを更新できる。
"""
```

```python
"""`foo.bar`用のテスト。

これは良くない例。上記の要約はすでに自明な情報しか記述されてないので、このDocstringは削除する必要がある。
"""
```

#### クラス

- [ ] クラスに公開属性がある場合は、`Attributes`セクションに記述する（書式は、後述する「関数・メソッド」の`Args`と同じ）
- [ ] 要約行には、そのクラスのインスタンスが何を表しているかの説明を書く
- [ ] そのクラスがどういうクラスであるというような、すでに自明な情報を記述してはならない

```python
class SampleClass:
    """クラスの要約をここに書く。

    より詳細なクラスの情報...
    より詳細なクラスの情報...

    Attributes:
        likes_spam: スパムを好むか否かを示すブール値。
        eggs: 産んだ卵の数を表す整数。
    """

    def __init__(self, likes_spam: bool = False):
        """なになにのクラスを初期化する。"""
        self.likes_spam = likes_spam
        self.eggs = 0

    def public_method(self):
        """なになにという処理を実行する。"""
```

```python
# OK:
class CheeseShopAddress:
    """チーズショップの住所。

    要約には、このクラスのインスタンスが何を表してるかを記述する。
    """

class OutOfCheeseError(Exception):
    """チーズが売り切れ。

    発生する例外が何を表しているのかを記述する。
    """`

# ダメ:
class CheeseShopAddress:
    """チーズショップの住所を記述するクラス。

    このクラスがどういうクラスであるという説明を記述してはならない。
    """

class OutOfCheeseError(Exception):
    """チーズがなくなったときに例外が発生する。

    例外が発生するコンテキストではなく、例外が何を表しているのかを記述する必要がある。
    """
```

#### 関数・メソッド

- [ ] コードを読まなくても、その関数の呼び出しを記述するのに十分な情報を提供する
- [ ] 関数の呼び出し構文とその意味を記述する
- [ ] その関数の使用方法に関連するものでなければ、実装の詳細については記述しない
- [ ] 呼び出し側に関係ないが、重要な関数の実装に関しては、docstringではなく、コードと一緒にコメントとして記述する
- [ ] ベースクラスからメソッドをオーバーライドするメソッドは、ベースクラスと共通する情報がある場合は、単にベースクラスを見るように記述するに留める
- [ ] 関数は、`Args`、`Returns`（`Yields`）、`Raises`のセクションを、必要に応じて持つ
- [ ] セクションは、コロンで終わる見出し行と、その下でインデントされた説明文を持つ

##### セクション

###### `Args`

- [ ] 各パラメータの名前を列挙する
- [ ] パラメータの名前の後に説明文が続く（インデントはしてもしなくてもいい）
- [ ] コードに型ヒントが書かれていない場合は、説明文に型を記述する
- [ ] 引数が、`*args`や`**kwargs`の場合は、引数の名前にアスタリスクをつけて、`*foo`や`**bar`のように記述する

###### `Returns`（`Yields`）

- [ ] ジェネレーターの場合は`Yields`を使用する
- [ ] 戻り値の型と説明を記述する
- [ ] 関数がNoneを返す（戻り値を持たないなど）場合は、このセクションは必要ない
- [ ] 戻り値がタプルの場合は、「戻り値`tuple(mat_a, mat_b)`。`mat_a`は...。`mat_b`は...。」のように記述する

###### `Raises`

- [ ] そのインターフェースに関連するすべての例外を説明と共に列挙する
- [ ] パラメータの名前の後に説明文が続く（インデントはしてもしなくてもいい）
- [ ] Docstringで指定したAPIに違反した場合に発生する例外は記述しない（逆説的にAPIに違反した動作をAPIの使用の一部にしてしまうため）

```python
def fetch_smalltable_rows(table_handle: smalltable.Table,
                          keys: Sequence[Union[bytes, str]],
                          require_all_keys: bool = False,
) -> Mapping[bytes, tuple[str, ...]]:
    """`smalltable`から行を取得する。

    与えられたキーに対応する行を、テーブルのインスタンス`table_handle`から、
    指定されたキーに対応する行を取得する。 文字列のキーはUTF-8でエンコードされる。

    Args:
        table_handle (table):
            オープンな`smalltable`。テーブルインスタンス。
        keys (str):
            取得する各テーブル行のキーを表す文字列の列。文字列のキーはUTF-8でエンコードされる。
        require_all_keys (bool):
            `True`の場合、すべてのキーに値が設定されている行のみが返される。

    Returns:
        取得したキーと対応するテーブルの行のデータを対応付ける辞書。
        各行は文字列のタプルとして表現される。
        例えば：

        {b'Serak': ('Rigel VII', 'Preparer'),
        b'Zim': ('Irk', 'Invader'),
        b'Lrrr': ('Omicron Persei 8', 'Emperor')}

        返されるキーは常にバイトである。 引数`keys`のキーが辞書にない場合、
        その行はテーブル上で見つからなかったということである（その場合、`require_all_keys`は`False`になるはずである）。

    Raises:
        IOError: `smalltable`にアクセスする際に発生するエラー。
    """
```

## コメント

コードの明らかでない部分についてコメントを書く。複雑な処理の前には複数行のコメントをつける。明らかでないものは、行末にコメントを書く。

また、物語のテキストのように読みやすくする必要がある。断片的な文章ではなく、完全な文章を記述すること。

```python
# `i`が配列のどこにあるかを調べるために、重み付き辞書検索を使用する。
# 配列中の最大の数値と配列サイズから位置を推定し、バイナリサーチを行って正確な数値を求める。
if i & (i - 1) == 0:    # `i`が０または２のべき乗のとき真。
```

コードについては絶対に記述しないこと。コードを読む人は自分よりもPythonのこと（自分のやろうとしていることではないことに注意）をよく知っていると仮定すること。

```python
# 悪いコメント例：次に，`b`配列を調べて，`i`が現れるたびに
# 次の要素が`i+1`であることを確認する。
```

## doctest

関数などのDocstringにdoctestを記述することで、読み手に動作の例を示して理解しやすくするとともに、Docstringと実際のコードとの間に乖離が生じていないかを確かめることができる。

以下のインタプリタ形式で書かれたPythonコードをdoctestを使用して、実行することができる。

```python
import doctest
doctest.testfile("Python/README.md")
```

>>> from Python.doctest_example import hello
>>> hello("Hello, World!")
'Hello, World!'
>>> n = 9
>>> if n % 15 == 0:
...     print("FizzBuzz")
... elif n % 3 == 0:
...     print("Fizz")
... elif n % 5 == 0:
...     print("Buzz")
... else:
...     print("x")
...
Fizz

Pythonファイル内に記述された`doctest`を実行するには以下のコードをPythonファイルの最後に記述し、以下のコマンドで実行する。

```python
if __name__ == "__main__":
    import doctest
    doctest.testmod()
```

```bash
python Python/doctest_example.py
python Python/doctest_example.py -v    # 詳細な実行結果を出力する
```

または単に以下のコマンドでを実行することでも`doctest`を実行できる。

```bash
python -m doctest -v Python/doctest_example.py
```

出力結果に空白行が生じる場合は、`<BLANKLINE>`と表記する必要がある。

```python
class AnalyzeIris:
    """Irisデータセットの分析。"""

    def Get(self) -> DataFrame:
        """表形式のIrisデータセットを取得する。

        Returns:
            iris_dataframe (DataFrame): irisデータセットが表形式で返される。

        >>> from ETL import AnalyzeIris
        >>> from pandas import DataFrame
        >>> import pandas as pd
        >>> iris: AnalyzeIris = AnalyzeIris()
        >>> iris_dataframe: DataFrame = iris.Get()
        >>> pd.set_option("display.max_rows", 4)
        >>> pd.set_option("display.max_columns", 4)
        >>> iris_dataframe
             sepal length (cm)  sepal width (cm)  ...  petal width (cm)  Label
        0                  5.1               3.5  ...               0.2      0
        1                  4.9               3.0  ...               0.2      0
        ..                 ...               ...  ...               ...    ...
        148                6.2               3.4  ...               2.3      2
        149                5.9               3.0  ...               1.8      2
        <BLANKLINE>
        [150 rows x 5 columns]
        """
```

## ロギング
