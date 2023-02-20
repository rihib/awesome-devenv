# C++

## 実行方法

`o`オプションで実行ファイルの名前を指定できる。

```bash
g++ -o your_file.out your_file.cpp
./your_file.out
```

## 命名規則

以下は、[Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)を参照している。

### 変数

通常の変数の場合は、スネークケースにすること（`table_name`など）。

### 定数

`constexpr`または`const`で宣言される定数には、先頭に`k`を付け、その後ろにキャメルケースで定数名を記述する。

```cpp
const int kDaysInAWeek = 7;
```

ただし稀に、大文字と小文字を区別できない場合に限り、アンダースコアをセパレータとして使用することができる。

```cpp
const int kAndroid8_0_0 = 24;  // Android 8.0.0
```
