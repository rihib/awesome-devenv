# Cloud9

## インスタンスの新規作成

1. Cloud9環境を作成
   - Cloud9がEC2インスタンスにSSH接続する設定項目を選択する
   - インスタンスタイプは`m5.large`を選択。HTML・CSS程度しか編集しない場合はより小さいインスタンスタイプでも大丈夫
2. EC2インスタンスのセキュリティグループを既存のCloud9用のものに変更し、自動作成されたセキュリティグループは削除する
3. 作成したCloud9を開き、画面左側のディレクトリ一覧の右上にある歯車マーク（設定ボタン）を押し「Show Hidden Files」と「Show Home in Favorites」にチェックを入れ、`~/.ssh/authorized/authorized_keys`を開き、ローカルマシンの`~/.ssh/cloud9.pub`に書いてある公開鍵をコピペする
4. `~/.ssh/config`のcloud9のIPアドレスを作成したEC2のものに変更する
