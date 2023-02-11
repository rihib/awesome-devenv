# pytest

カレントフォルダとそのサブフォルダ内にあり、名前が`test_`で始まるか、`_test`で終わるPython（`.py`）ファイルを探す挙動をとります。ただし、サブディレクトリ内のファイルを`import`可能にするためには、サブディレクトリ内に`__init__.py`が含まれている必要があります。

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
