"""`Python/README.md`に記述されているdoctest用のサンプルファイル。"""

def hello(s: str) -> str:
    """渡された文字列をそのまま出力する。

    Args:
        s (str): 任意の出力したい文字列。

    Returns:
        s (str): 渡された文字列をそのまま返す。
    """
    return s


if __name__ == "__main__":
    import doctest
    doctest.testmod()
