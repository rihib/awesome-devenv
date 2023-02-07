# anyenv

## anyenvのインストール

```bash
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.profile
~/.anyenv/bin/anyenv init
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
exec $SHELL
anyenv install --init
pushd $(anyenv root)
git checkout v1.1.5
popd
```

## 特定のバージョンのanyenvに変更する

```bash
pushd $(anyenv root)
git fetch
git tag    # 利用できるタグの一覧を表示
git checkout v1.1.5
popd
```

## anyenv-updateのインストール

anyenvにて管理しているすべての**envとプラグインを一括でアップデートできる`anyenv update`コマンドを提供するanyenvのプラグイン。

```bash
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
```

## コマンド

### anyenvのバージョンを表示

```bash
anyenv -v
```

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

### anyenvのルートディレクトリのパスを表示

```bash
anyenv root
```

### **envのインストール

詳しいインストール方法については、それぞれのディレクトリの`README.md`を参照。

```bash
anyenv install **env
exec $SHELL
```

### 使用している**envの一覧を表示

```bash
anyenv versions
```

### **envとプラグインを一括でアップデート

アップデートする前に、anyenvのGitリポジトリのブランチを`master`に戻しておく必要がある。

```bash
pushd $(anyenv root)
git checkout master
popd
```

以下のコマンドでanyenvの管理するすべての**envとプラグインを一括でアップデートできる。

```bash
anyenv update
```

アップデートが終わったら、anyenvを指定のバージョンにする。

```bash
pushd $(anyenv root)
git checkout v1.1.5
popd
```
