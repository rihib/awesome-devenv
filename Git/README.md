# Git

Cloud9やコンテナ等を使用して、新規に環境を作成した際は、Gitリポジトリを作成後、最初に以下の設定をすること。メールアドレスはGitHubで使用しているものにしないとGitHubリポジトリにpushする際に、誰がpushしたのかがわからなくなってしまう。

```bash
git config --global user.name <YOUR_USER_NAME>
git config --global user.email <YOUR_USER_EMAIL>
git config --global core.editor vim
```
