# Cloud9

## インスタンスの新規作成

1. SSHを選択したCloud9インスタンスを作成
2. EC2インスタンスのセキュリティグループを既存のCloud9用のものに変更し、自動作成されたセキュリティグループは削除する
3. 作成したCloud9を開き、画面左側のディレクトリ一覧の右上にある歯車マーク（設定ボタン）を押し「Show Hidden Files」と「Show Home in Favorites」にチェックを入れ、~/.ssh/authorized/authorized_keysを開き、ローカルマシンの~/.ssh/cloud9.pubに書いてある公開鍵をコピペする
4. ~/.ssh/configのcloud9のIPアドレスを作成したEC2のものに変更する
