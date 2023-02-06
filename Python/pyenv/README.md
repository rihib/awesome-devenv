# pyenv

## インストール

anyenvを使ってインストールする。詳細は`anyenv/README.md`を参照。

## シェルを設定する

### bash

`~/.bashrc`に対して以下のコマンドを実行する。
&nbsp;
また、`~/.profile`、`~/.bash_profile`、`~/.bash_login`のうち、存在するファイルに対しては同様に以下のコマンドを実行する。もし、３つとも存在しない場合は、`~/.profile`に対して実行すること。
&nbsp;
`$PYENV_ROOT`には、`.anyenv`下にインストールしたpyenvのパスを指定していることに注意。

```bash
echo 'export PYENV_ROOT="<HOME_PATH>/.anyenv/envs/pyenv"' >> <FILE_PASS>
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> <FILE_PASS>
echo 'eval "$(pyenv init -)"' >> <FILE_PASS>
```

最後にシェルを再起動して、変更を適用させる。

```bash
$ exec $SHELL
$ python
Python 3.11.1 (main, Feb  6 2023, 04:01:47) [GCC 7.5.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## 特定のバージョンのpyenvに変更する

```bash
pushd $(pyenv root)
git fetch
git tag    # 利用できるタグの一覧を表示
git checkout v2.3.12
popd
```

## コマンド

### pyenvのバージョンを確認する

```bash
$ pyenv -v
pyenv 2.3.12-6-gc8c324af
```

### `versions`や`shims`が保存されているルートディレクトリのパスを表示

`<HOME_PATH>/.anyenv/envs/pyenv`と表示されるか確認。`<HOME_PATH>/.pyenv`と表示された場合は`$PYENV_ROOT`の値が前述した通りに設定されていない。

```bash
$ pyenv root
/home/ubuntu/.anyenv/envs/pyenv
```

### 利用可能なPythonバージョンの一覧を表示

```bash
pyenv install -l
```

### 特定のバージョンのPythonをインストール

```bash
pyenv install 3.11.1
pyenv rehash
```

### インストールしたPythonバージョンの一覧を表示

それぞれのバージョンがインストールされているディレクトリのパスも表示される（`<HOME_PATH>/.anyenv/envs/pyenv/versions/<PYTHON_VERSION>`と表示されるはず。`<HOME_PATH>/.pyenv/versions/<PYTHON_VERSION>`と表示された場合は`$PYENV_ROOT`の値が前述した通りに設定されていない。）。

```bash
pyenv versions
```

### グローバルに使用するPythonのバージョンを指定

```bash
pyenv global 3.11.1    # v3.11.1を使用する場合
pyenv global system    # システムが提供するバージョンを使用する場合
```

### カレントディレクトリで使用するPythonのバージョンを指定・解除

設定すると、カレントディレクトリ内に`.python-version`ファイルが作成される。解除すると、削除される。
&nbsp;
もちろんカレントディレクトリ内だけでなく、そのサブディレクトリ内でも適用される。

```bash
$ pyenv local 3.11.1
$ ls -a
.  ..  .python-version
$ cat .python-version
3.11.1
$ pyenv local --unset
$ ls -a
.  ..
```

### 現在のシェルセッションで使用するPythonバージョンを指定・解除

```bash
pyenv shell 3.11.1
pyenv shell --unset
```

### pyenvによって呼び出されるコマンドの実行ファイルの場所を表示する

```bash
pyenv which python3
pyenv which pip
```

### 特定のPythonバージョンをアンインストールする

```bash
pyenv uninstall 3.11.1
```
