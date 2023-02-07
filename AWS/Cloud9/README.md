# Cloud9

## インスタンスの新規作成

1. Cloud9用のセキュリティグループを作成
2. Cloud9環境を作成
   - Cloud9がEC2インスタンスにSSH接続する設定項目を選択
   - インスタンスタイプは`m5.large`を選択。HTML・CSS程度しか編集しない場合はより小さいインスタンスタイプでも大丈夫
3. EC2インスタンスのセキュリティグループを既存のCloud9用のものに変更し、自動作成されたセキュリティグループは削除
4. `cloud9`という名前のキーペアを作成し、ローカルの`~/.ssh`下に配置
6. 作成したCloud9を開き、画面左側のディレクトリ一覧の右上にある歯車マーク（設定ボタン）を押し「Show Hidden Files」と「Show Home in Favorites」にチェックを入れ、`~/.ssh/authorized_keys`を開き、ローカルマシンの`~/.ssh/cloud9.pub`に書いてある公開鍵をコピペ
7. `~/.ssh/config`を編集
8. VSCodeからCloud9にSSH接続

## インスタンスに再接続する

1. Cloud9を開き、`Manage EC2 Instance`を押して、EC2インスタンスの管理画面に行き、IPv4アドレスをコピー
2. ローカルの`~/.ssh/config`を編集（`~/.ssh/config`のcloud9のIPアドレスを作成したEC2のものに変更）
3. VSCodeからCloud9にSSH接続（途中、表示されるダイアログでは「続行」を押す」）
