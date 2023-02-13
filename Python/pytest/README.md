# pytest

カレントフォルダとそのサブフォルダ内にあり、名前が`test_`で始まるか、`_test`で終わるPython（`.py`）ファイルを探す挙動をとります。ただし、サブディレクトリ内のファイルを`import`可能にするためには、サブディレクトリ内に`__init__.py`が含まれている必要があります。

## ユニットテストとは

ユニットテストは、ユニットのインターフェイス（引数と戻り値）のみに着目します[^1]。ある関数についてユニットテストするには、考えられるあらゆる種類の入力をし、それぞれ適切な出力が返ってくるかをチェックします。

ユニットテストは、コミット前、マージ前、ビルド後などに頻繁に実行することが望ましいです。そのためには高速に実行できるようにする必要があるため、ユニットテストそれ自体とテスト対象のコードのみで独立して実行できるように、モック等を利用して外部依存しないように書く必要があります。

ここに書いてある概要は[Python testing in Visual Studio Code](https://code.visualstudio.com/docs/python/testing#_a-little-background-on-unit-testing)を参照しています。より詳細な概要を知りたい場合は[Unit testing - Wikipedia](https://en.wikipedia.org/wiki/Unit_testing)、具体的な実行方法を知りたい場合は[gwtw/py-sorting - GitHub](https://github.com/gwtw/py-sorting)を参照してください。

## Tips

### クラスを使用する際、初期化メソッドを使うことはできない

以下のように書くことはできない。ユニットテストは、テスト対象コードとテストコード自身のみで実行可能な状態でなければならないため。

```python
# First Party
from src.ETL import AnalyzeIris


class TestAnalyzeIris:
    def __init__(self) -> None:
        self.iris: AnalyzeIris = AnalyzeIris()

    def test_Get(self) -> None:
        assert self.iris.Get() == "place_holder"
```

なので以下のように書く必要がある。

```python
# First Party
from src.ETL import AnalyzeIris


class TestAnalyzeIris:
    def test_Get(self) -> None:
        iris: AnalyzeIris = AnalyzeIris()
        assert iris.Get() == "place_holder"
```
