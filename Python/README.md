# Python

## リンター・フォーマッターの有効化

以下のコマンドを実行し、必要なリンター・フォーマッターをインストールする。

```bash
cd $<PRJ_NAME>_ROOT
pyenv local 3.11.1
poetry add --group dev bandit black flake8 isort mypy
```

## VSCode拡張機能

### autoDocstring

クラスやメソッドを書き終わったあと、宣言文の下にクオーテーションを３つ入力し、`Enter`を押すと、Docstringを自動生成できる。
<br/>
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
