# anyenv

## anyenvのインストール

```bash
$ git clone https://github.com/anyenv/anyenv ~/.anyenv
$ echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile    # bashを使用している場合。他のシェルを使用している場合は公式ドキュメントを参照
$ exec $SHELL -l
$ ~/.anyenv/bin/anyenv init
# Load anyenv automatically by adding
# the following to ~/.bash_profile:

eval "$(anyenv init -)"
$ eval "$(anyenv init -)"
ANYENV_DEFINITION_ROOT(/home/ubuntu/.config/anyenv/anyenv-install) doesn't exist. You can initialize it by:
> anyenv install --init
$ anyenv install --init
Manifest directory doesn't exist: /home/ubuntu/.config/anyenv/anyenv-install
Do you want to checkout https://github.com/anyenv/anyenv-install.git? [y/N]: y
Cloning https://github.com/anyenv/anyenv-install.git master to /home/ubuntu/.config/anyenv/anyenv-install...
Cloning into '/home/ubuntu/.config/anyenv/anyenv-install'...
remote: Enumerating objects: 71, done.
remote: Counting objects: 100% (14/14), done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 71 (delta 4), reused 4 (delta 1), pack-reused 57
Unpacking objects: 100% (71/71), done.

Completed!
$ exec $SHELL -l
$ anyenv -v
anyenv 1.1.5-1-g5c58783
```

## anyenv-updateのインストール

anyenvにて管理しているすべての**envとプラグインを一括でアップデートできる`anyenv update`コマンドを提供するanyenvのプラグイン。

```bash
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
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

```bash
anyenv install pyenv
exec $SHELL -l
pyenv -v
```

### 使用している**envの一覧を表示

```bash
anyenv versions
```

### **envとプラグインを一括でアップデート

```bash
anyenv update
```
