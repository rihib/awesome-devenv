# Cloud9

## インスタンスの新規作成（初回）

1. Cloud9環境を作成
   - Cloud9がEC2インスタンスにSSH接続する設定項目を選択
   - インスタンスタイプは`m5.large`を選択。HTML・CSS程度しか編集しない場合はより小さいインスタンスタイプでも大丈夫
3. EC2インスタンスのセキュリティグループの設定を編集
4. `cloud9`という名前のキーペアを作成し、ローカルの`~/.ssh`下に配置
6. 作成したCloud9を開き、画面左側のディレクトリ一覧の右上にある歯車マーク（設定ボタン）を押し「Show Hidden Files」と「Show Home in Favorites」にチェックを入れ、`~/.ssh/authorized_keys`を開き、ローカルの`~/.ssh/cloud9.pub`に書いてある公開鍵をコピペ
7. ローカルの`~/.ssh/config`を編集
8. VSCodeからCloud9にSSH接続

## インスタンスの新規作成（2回目以降）

1. Cloud9環境を作成
   - Cloud9がEC2インスタンスにSSH接続する設定項目を選択
   - インスタンスタイプは`m5.large`を選択。HTML・CSS程度しか編集しない場合はより小さいインスタンスタイプでも大丈夫
2. EC2インスタンスのセキュリティグループを既存のCloud9用のものに変更し、自動作成されたセキュリティグループは削除
3. 作成したCloud9を開き、画面左側のディレクトリ一覧の右上にある歯車マーク（設定ボタン）を押し「Show Hidden Files」と「Show Home in Favorites」にチェックを入れ、`~/.ssh/authorized_keys`を開き、ローカルの`~/.ssh/cloud9.pub`に書いてある公開鍵をコピペ
4. ローカルの`~/.ssh/config`のcloud9のIPアドレスを作成したEC2のものに変更
5. VSCodeからCloud9にSSH接続（途中、表示されるダイアログでは「続行」を押す」）

## インスタンスに再接続する

1. ローカルの`~/.ssh/config`のcloud9のIPアドレスを作成したEC2のものに変更
3. VSCodeからCloud9にSSH接続（途中、表示されるダイアログでは「続行」を押す」）
