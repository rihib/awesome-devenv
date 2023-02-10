# Git

## 初期設定
Cloud9やコンテナ等を使用して、新規に環境を作成した際は、Gitリポジトリを作成後、最初に以下の設定をすること。メールアドレスはGitHubで使用しているものにしないとGitHubリポジトリにpushする際に、誰がpushしたのかがわからなくなってしまう。

```bash
git config --global user.name <YOUR_USER_NAME>
git config --global user.email <YOUR_USER_EMAIL>
git config --global core.editor vim
```

## コマンド

### `git add`

```bash
git add <PATH>
git add -A
git add -p <PATH>
```

### `git commit`

```bash
git commit
git commit -m "コメント"
```

### `git config`

```bash
git config --global
git config --local
git config -l
```

### `git diff`

```bash
git diff <PATH>
```

### `git log`

```bash
git log
git log --oneline
```

### `git push`

```bash
git push
```

### `git status`
