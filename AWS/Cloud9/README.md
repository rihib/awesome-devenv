# Cloud9

## インスタンスの新規作成

1. Cloud9用のセキュリティグループを作成する
2. Cloud9環境を作成
   - Cloud9がEC2インスタンスにSSH接続する設定項目を選択する
   - インスタンスタイプは`m5.large`を選択。HTML・CSS程度しか編集しない場合はより小さいインスタンスタイプでも大丈夫
3. EC2インスタンスのセキュリティグループを既存のCloud9用のものに変更し、自動作成されたセキュリティグループは削除する
4. `cloud9`という名前のキーペアを作成し、ローカルの`~/.ssh`下に配置する
6. 作成したCloud9を開き、画面左側のディレクトリ一覧の右上にある歯車マーク（設定ボタン）を押し「Show Hidden Files」と「Show Home in Favorites」にチェックを入れ、`~/.ssh/authorized_keys`を開き、ローカルマシンの`~/.ssh/cloud9.pub`に書いてある公開鍵をコピペする
7. `~/.ssh/config`を編集する（`~/.ssh/config`のcloud9のIPアドレスを作成したEC2のものに変更する）
8. VSCodeからCloud9にSSH接続する
