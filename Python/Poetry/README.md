# Poetry

## インストール

下記のコマンドを実行してインストールする。`POETRY_VERSION`でインストールするバージョンを指定する。ここで指定している`POETRY_HOME`と`POETRY_VERSION`は`export`できない環境変数なので注意。

```bash
python -m pip install poetry==    # 現環境でインストールできるバージョン一覧を表示。Pythonのバージョンによってインストールできるバージョンが変わってくる
curl -sSL https://install.python-poetry.org | POETRY_HOME=$HOME/.poetry POETRY_VERSION=1.3.2 python3 -
```

パスを通すために、`~/.bashrc`と、`~/.profile`、`~/.bash_profile`、`~/.bash_login`の３つのうちで存在するファイル全てに対して環境変数を記述する（[参照](https://qiita.com/rihib/items/79f19029b4160eb81226#bash-1)）。以下は`~/.bash_login`が存在しない場合の例。

```bash
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.bashrc
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.bash_profile
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.profile
exec $SHELL
```

## 既存のプロジェクトが存在しない場合

### 初期化

以下のコマンドを実行してプロジェクトディレクトリを初期化する。
<br/>
ちなみに`poetry init`を実行した際に聞かれる質問には以下のように答える。`License`には[SPDX License List](https://spdx.org/licenses/)の`Identifier`を値として使用する。もしライセンスがない場合は、`Proprietary`を値として使用する。

```bash
Package name [PROJECT_NAME]:  PROJECT_NAME
Version [0.1.0]:  PROJECT_VERSION
Description []:  DESCRIPTION
Author [NAME <EMAIL>, n to skip]:  NAME <EMAIL>
License []:  LICENSE
Compatible Python versions [^3.11]:  3.11.1
```

```bash
cd $<PRJ_NAME>_ROOT
pyenv local 3.11.1
python -m venv .venv
poetry config virtualenvs.in-project true --local
poetry config virtualenvs.prefer-active-python true --local
poetry init    # pyproject.tomlが生成される
poetry install    # poetry.lockが生成される
```

生成された`pyproject.toml`と`poetry.lock`は、どちらもリポジトリにコミットする必要がある。`poetry.lock`にはパッケージの依存関係とバージョンが正確に記述される。基本的に、`poetry.lock`の内容を手動で変更することはない。

### `pyproject.toml`に追記

この`README.md`と同じ階層にある`pyproject.toml`の内容をコピーして、生成した`pyproject.toml`に追記する。追記した後は、以下のコマンドを実行して、変更を`poetry.lock`に反映させる必要がある。

```bash
poetry lock --no-update
```

## 既存のプロジェクトが存在する場合

`pyproject.toml`、`poetry.lock`と同じ階層に移動し、`poetry install`を実行することで、正確なパッケージの依存関係とバージョンを再現する。

```bash
cd $<PRJ_NAME>_ROOT
pyenv local 3.11.1
python -m venv .venv
poetry config virtualenvs.in-project true --local
poetry config virtualenvs.prefer-active-python true --local
poetry install
```

## グループ

### グループの作成

グループを定義し、それぞれのグループごとに必要なパッケージをインストールすることができる。例えば、開発用途にしか使わないパッケージを本番環境ではインストールしないようにするといったことが可能になる。
<br/>
グループは`tool.poetry.group.<GROUP_NAME>`というセクション名で`pyproject.toml`に宣言できる。インストールするパッケージは`tool.poetry.group.<GROUP_NAME>.dependencies`というセクションに記述される。

```text
[tool.poetry.group.test]

[tool.poetry.group.test.dependencies]
pytest = "^6.0.0"
pytest-mock = "*"
```

### オプショナルグループ

以下のようにしてグループをオプショナルとして宣言することができる。

```bash
[tool.poetry.group.docs]
optional = true

[tool.poetry.group.docs.dependencies]
mkdocs = "*"
```

オプショナルとして宣言されたグループのパッケージは、`poetry install`の実行時に明示的に`with`オプションで指定しない限り、インストールされなくなる。

```bash
poetry install --with test,docs
```

`without`オプションと`with`オプションは併用できる。その際、`without`オプションの方が優先されるため、以下の場合、`docs`グループのパッケージのみがインストールされる。

```bash
poetry install --with test,docs --without docs
```

### `main`グループ

通常、特に指定がない限りは、パッケージは`main`グループに属する。`main`グループは暗黙的に宣言されているので、`pyproject.toml`で直接的には宣言されていない。

## コマンド

### Poetryのバージョンを表示する

```bash
$ poetry --version
Poetry (version 1.3.2)
```

### Poetryを指定したバージョンに更新する

```bash
poetry self update    # 最新バージョンにアップデートする場合
poetry self update 1.2.0    # バージョンを指定する場合
```

### Poetryをアンインストールする

```bash
curl -sSL https://install.python-poetry.org | python3 - --uninstall
```

### Poetryの設定の一覧を表示

```bash
poetry config --list
```

### Poetryの設定を変更

```bash
poetry config virtualenvs.prompt "{project_name}"    # 仮想環境のプロンプトを変更
```

`virtualenvs.in-project = null`の場合、デフォルトでPoetryは`{cache-dir}/virtualenvs`の下に仮想環境を作成するか、`{project-dir}/.venv`ディレクトリが利用可能である場合にそれを使用する。
<br/>
`virtualenvs.in-project = true`の場合、仮想環境はプロジェクトのルートディレクトリ内の`.venv`というディレクトリに作成される（Poetryはプロジェクトのルートディレクトリ内に`.venv`が存在することを前提に動作するので、先に`.venv`ディレクトリを作っておく必要がある）。
<br/>
`virtualenvs.in-project = false`の場合、Poetryは`.venv`ディレクトリを無視する。
<br/>
また、`local`オプションを指定すると、その設定はそのプロジェクトにのみ適用される（この設定が記述された`poetry.toml`がプロジェクトルートディレクトリ下に生成される）。

```bash
poetry config virtualenvs.in-project true --local
```

`virtualenvs.prefer-active-python = true`の場合、新しい仮想環境を作成するために、現在有効になっているPythonのバージョンを使用する。`virtualenvs.prefer-active-python = false`の場合、Poetryのインストール時に使用されたPythonのバージョンが使用される。

```bash
poetry virtualenvs.prefer-active-python true --local
```

### パッケージをインストールする

`poetry.lock`がない状態で`poetry install`を実行すると、`pyproject.toml`で指定した条件の中で一番最新のバージョンが`poetry.lock`に書き込まれて、仮想環境にインストールされる。`poetry.lock`がある状態で`poetry install`が実行されると、`poetry.lock`に記述されているバージョンが正確に仮想環境にインストールされる。そのため、バージョンの一貫性は保たれるので、最初にパッケージをインストールする際や、`pyproject.toml`にバージョンを記述する際は、必要がなければバージョンを細かく指定する必要はない。

```bash
poetry install    # `main`グループのパッケージがインストールされる
poetry install --without test    # 指定したグループのパッケージのみインストールされない
poetry install --with test,docs    # 指定したオプショナルグループのパッケージもインストールされる
poetry install --only main    # 指定したグループのパッケージのみインストールされる
```

### パッケージを追加・更新する

同じパッケージであっても、バージョンが異なるものを`poetry add`した場合は、既存の設定が上書きされる。

```bash
poetry add <PACKAGE>
poetry add pytest --group test    # パッケージを`test`グループに追加する
```

### パッケージを削除する

```bash
poetry remove mkdocs
poetry remove mkdocs --group docs    # 指定したグループからパッケージを削除する
```

### `poetry.lock`に記述されていないパッケージを仮想環境からすべて削除する

`poetry.lock`にて定義されているパッケージと依存関係のみが仮想環境に存在するようにできる。

```bash
poetry install --sync
poetry install --without dev --sync    # `dev`グループ以外のパッケージを`poetry.lock`と同期する
poetry install --with docs --sync    # `docs`グループも含めたパッケージを`poetry.lock`と同期する
```

### スクリプトやコマンドを実行する

```bash
poetry run python example.py
poetry run black
poetry run pytest
```

### 仮想環境の有効化・終了

```bash
poetry shell
exit
```

### `poetry.lock`のバージョンを更新せずにファイルのみ更新する

`no-update`オプションをつけることで、ロックされたバージョンは更新せずに、`poetry.lock`だけ更新することができる。

```bash
poetry lock --no-update
```

### `poetry.lock`のパッケージのバージョンを更新する

再度、`pyproject.toml`で指定した条件の中で一番最新のバージョンが`poetry.lock`に書き込まれる。これは`poetry.lock`を削除して`poetry install`を実行するのと同じことである。
<br/>
`pyproject.toml`を手動で変更した際に、その変更を`poetry.lock`に適用するのにも使えるが、その際は他のパッケージのバージョンも意図せず上がってしまう可能性があるので、なるべく手動で変更するのを避け、コマンドを使用して変更を加える必要がある。

```bash
poetry update
```

### `poetry.lock`を`requirements.txt`に変換する

`install`コマンドとは異なり、このコマンドはオプションを指定せずに使用すると、`main`グループのパッケージのみを含める。`install`コマンドと同様に`--without`、`--with`、`--only`などが使える。

```bash
poetry export --format requirements.txt --output requirements.txt
```

### 仮想環境の情報を表示する

```bash
poetry env info    # 現在アクティブな仮想環境の情報を表示する
poetry env info --path    # 仮想環境へのパスを表示する
poetry env list    # 現在のプロジェクトに関係する仮想環境があるディレクトリの一覧を表示する
poetry env list --full-path    # 現在のプロジェクトに関係する仮想環境の一覧を絶対パスで表示する
```

### 仮想環境を削除する

```bash
poetry env remove /full/path/to/python
poetry env remove python3.7
poetry env remove 3.7
poetry env remove test-O3eWbxRl-py3.7
poetry env remove python3.6 python3.7 python3.8    # 一度に複数の仮想環境を削除する
poetry env remove --all    # すべての仮想環境を削除する
```
