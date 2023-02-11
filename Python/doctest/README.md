# doctest

以下のインタプリタ形式で書かれたPythonコードをdoctestを使用して、実行することができる。

```python
import doctest
doctest.testfile("Python/doctest/README.md")
```

>>> from Python.doctest.doctest_example import hello
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
python <PYTHON_FILE_PATH>
python <PYTHON_FILE_PATH> -v    # 詳細な実行結果を出力する
```

または単に以下のコマンドでを実行することでも`doctest`を実行できる。

```bash
python -m doctest -v <PYTHON_FILE_PATH>
```
