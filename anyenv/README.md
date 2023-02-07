# anyenv

## anyenvのインストール

```bash
$ git clone https://github.com/anyenv/anyenv $<PRJ_NAME>_ROOT/.venv/anyenv
$ echo 'export PATH="$<PRJ_NAME>_ROOT/.venv/anyenv/bin:$PATH"' >> ~/.bashrc
$ echo 'export PATH="$<PRJ_NAME>_ROOT/.venv/anyenv/bin:$PATH"' >> ~/.bash_profile
$ echo 'export PATH="$<PRJ_NAME>_ROOT/.venv/anyenv/bin:$PATH"' >> ~/.profile
$ source ~/.bashrc
$ source ~/.bash_profile
$ source ~/.profile
$ exec $SHELL -l
$ $<PRJ_NAME>_ROOT/.venv/anyenv/bin/anyenv init
$ anyenv install --init
$ eval "$(anyenv init -)"
$ exec $SHELL -l
$ anyenv -v
anyenv 1.1.5
```

## 特定のバージョンのanyenvに変更する

```bash
pushd $<PRJ_NAME>_ROOT/.venv/anyenv
git fetch
git tag    # 利用できるタグの一覧を表示
git checkout v1.1.5
popd
```

## anyenv-updateのインストール

anyenvにて管理しているすべての**envとプラグインを一括でアップデートできる`anyenv update`コマンドを提供するanyenvのプラグイン。

```bash
mkdir -p $<PRJ_NAME>_ROOT/.venv/anyenv/plugins
git clone https://github.com/znz/anyenv-update.git $<PRJ_NAME>_ROOT/.venv/anyenv/plugins/anyenv-update
```

## 特定のバージョンのanyenv-updateに変更する

```bash
pushd $<PRJ_NAME>_ROOT/.venv/anyenv/plugins/anyenv-update
git fetch
git tag    # 利用できるタグの一覧を表示
git checkout v1.2.0
popd
```

## コマンド

### インストール可能な**envの一覧を表示

```bash
$ anyenv install -l    # インストール可能な**envの一覧を表示
  Renv
  crenv
  denv
  erlenv
  exenv
  goenv
  hsenv
  jenv
  jlenv
  kubectlenv
  luaenv
  nodenv
  phpenv
  plenv
  pyenv
  rbenv
  sbtenv
  scalaenv
  swiftenv
  tfenv
```

### **envのインストール

詳しいインストール方法については、それぞれのディレクトリの`README.md`を参照。

```bash
anyenv install **env
exec $SHELL -l
```

### 使用している**envの一覧を表示

```bash
anyenv versions
```

### **envとプラグインを一括でアップデート

```bash
anyenv update
```
