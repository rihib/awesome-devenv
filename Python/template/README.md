# Pythonプロジェクトドキュメントテンプレート

このドキュメントについて、不備やわかりづらい点、質問などがありましたら、その都度気軽にIssueを立ててください。

半角山括弧（`< >`）で囲まれた部分はプレースホルダーです。適宜、適切な値を代入してください。

パスが通らなくて詰まった場合は、[今日こそ『パスが通らない！！』から完全におさらばするための記事](https://qiita.com/rihib/items/79f19029b4160eb81226)を参照してください。

## 1. 環境構築手順

### 1.1 新規プロジェクト

プロジェクトを新規作成する人は、以下の手順で環境構築をしてください。

### 1.1.1 GitHubリポジトリの作成

GitHubにてリポジトリを作成してください。その際、`README.md`とPython用の`.gitignore`を自動生成するようにしてください。

### 1.1.2 Cloud9環境の新規作成

1. Cloud9環境を作成
   - Cloud9がEC2インスタンスにSSH接続する設定項目を選択
   - インスタンスタイプは`m5.large`を選択。HTML・CSS程度しか編集しない場合はより小さいインスタンスタイプでも大丈夫
1. EC2インスタンスのセキュリティグループの設定を編集
1. `cloud9`という名前のキーペアを作成し、ローカルの`~/.ssh`下に配置
1. 作成したCloud9を開き、画面左側のディレクトリ一覧の右上にある歯車マーク（設定ボタン）を押し「Show Hidden Files」と「Show Home in Favorites」にチェックを入れ、`~/.ssh/authorized_keys`を開き、ローカルの`~/.ssh/cloud9.pub`に書いてある公開鍵をコピペ
1. ローカルの`~/.ssh/config`を編集
1. VSCodeからCloud9にSSH接続

### 1.1.x シェルスクリプトを実行する

このドキュメントと同じディレクトリにある`awesome-pydevenv.sh`をサーバーの任意の場所に置き、変数の値を適切なものに変更してください。変更したら、以下のコマンドで実行すると自動で環境構築が行われます。手動で環境構築したい場合はこの項をスキップして、次の項からはじめてください。

```bash
source /path/to/awesome-pydevenv.sh
```

### 1.1.3 環境変数`<PRJ_NAME>_ROOT`を作成

以下のコマンドを実行し、プロジェクトルートディレクトリの絶対パスを値にもつ環境変数`<PRJ_NAME>_ROOT`を作成してください。

```bash
echo "export <PRJ_NAME>_ROOT=<PRJ_ROOT_PATH>" >> ~/.bashrc
echo "export <PRJ_NAME>_ROOT=<PRJ_ROOT_PATH>" >> ~/.bash_profile
echo "export <PRJ_NAME>_ROOT=<PRJ_ROOT_PATH>" >> ~/.profile
exec $SHELL
```

### 1.1.4 Gitの設定

以下のコマンドを実行し、Gitの設定をしてください。

```bash
git config --global user.name <YOUR_USER_NAME>
git config --global user.email <YOUR_USER_EMAIL>
git config --global core.editor vim
```

### 1.1.5 プロジェクトルートディレクトリの作成

以下のコマンドを実行し、プロジェクトルートディレクトリを作成してください。

```bash
mkdir -p $<PRJ_NAME>_ROOT
git clone <YOUR_GITHUB_REPOSITORY_URL> $<PRJ_NAME>_ROOT
```

### 1.1.6 anyenvのインストール

以下のコマンドを実行して、anyenvをインストールしてください。

```bash
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.profile
~/.anyenv/bin/anyenv init
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
exec $SHELL
echo y | anyenv install --init
pushd $(anyenv root)
git checkout v1.1.5
popd
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
```

### 1.1.7 pyenvとPythonのインストール

以下のコマンドを実行して、pyenvとPythonをインストールしてください。

```bash
anyenv install pyenv
exec $SHELL -l
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.bash_profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
echo 'export PYENV_ROOT="$(anyenv root)/envs/pyenv"' >> ~/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile
exec $SHELL
pushd $(pyenv root)
git checkout v2.3.12
popd
pyenv install 3.11.1
pyenv rehash
pyenv global 3.11.1
```

### 1.1.8 Poetryのインストールと初期化

以下のコマンドを実行して、Poetryをインストールするとともに、プロジェクトルートディレクトリを初期化してください。

```bash
curl -sSL https://install.python-poetry.org | POETRY_HOME=$HOME/.poetry POETRY_VERSION=1.3.2 python3 -
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.bashrc
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.bash_profile
echo 'export PATH=$HOME/.poetry/bin:$PATH' >> ~/.profile
exec $SHELL
cd $<PRJ_NAME>_ROOT
pyenv local 3.11.1
python -m venv .venv
poetry config virtualenvs.in-project true --local
poetry config virtualenvs.prefer-active-python true --local
poetry init --no-interaction --name "<YOUR_PRJ_NAME>" --description "<DESCRIPTION>" --author "NAME <EMAIL>" --python 3.11.1
poetry install
```

このドキュメントと同じディレクトリにある`pyproject.toml`の内容をコピーし、生成された`pyproject.toml`に追記してください。次に、以下のコマンドを実行し、変更を`poetry.lock`に反映させてください。

```bash
poetry lock --no-update
```

### 1.1.9 リンター・フォーマッターをインストールする

以下のコマンドを実行し、リンター・フォーマッターをインストールしてください。

```bash
poetry add --group dev bandit black flake8 isort mypy
```

### 1.1.10 VSCodeの設定

以下のコマンドを実行してプロジェクトルートディレクトリ直下に`.vscode/settings.json`を作成してください。

```bash
mkdir $<PRJ_NAME>_ROOT/.vscode
touch $<PRJ_NAME>_ROOT/.vscode/settings.json
```

次に、このドキュメントと同じディレクトリにある`.vscode/settings.json`の内容を、作成した`.vscode/settings.json`にコピペしてください。

最後に、一旦SSH接続を切り、再度接続し直してください。再接続時に拡張機能がインストールされます。

### 1.1.11 必要なディレクトリとファイルを作成する

以下のコマンドを実行し、必要なディレクトリとファイルを作成してください。

```bash
mkdir $<PRJ_NAME>_ROOT/src
touch $<PRJ_NAME>_ROOT/src/__init__.py
mkdir $<PRJ_NAME>_ROOT/tests
touch $<PRJ_NAME>_ROOT/tests/__init__.py
```

### 1.1.12 GitHubリポジトリに`push`する

以下のコマンドを実行して、作成したプロジェクトルートディレクトリをGitHubリポジトリに`push`してください。

```bash
git add -A
git commit -m "プロジェクトを作成"
git push
```

### 1.2 既存プロジェクト

既存プロジェクトに参加する人は以下の手順で環境構築をしてください。
