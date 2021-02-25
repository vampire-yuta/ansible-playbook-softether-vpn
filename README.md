# ansible-playbook-softether-vpn
## 前提
- 実行端末に`ansible-playbook`コマンドがインストールされていること
- 作業対象マシンが`root`ユーザーで直接ログインが可能な状態であること

## 準備
### 資格情報の登録
```
ssh-copy-id root@<作業対象マシンのIPアドレス>
```

### 実行対象マシンをhostsへ登録
- `/etc/ansible/hosts`
```
[vpnservers]
192.168.11.246
```

### カスタマイズ例
- `vars/vpn.yml`に明示的に指定したい値を記載する
- 次の例は、4ユーザーを作成する例
- とくに何も設定しない場合、`roles/main/defaults/`等のデフォルト設定値が適用される

```
vpn_users:
  - name: user1
    password: password
    groups: [group1]
  - name: user2
    password: password
    groups: [group1]
  - name: user3
    password: password
    groups: [group2]
  - name: user4
    password: password
    groups: [group2]
```

## 実行
```
ansible-playbook main.yaml -u root
```

## 利用方法
- 次のURLからVPN Server操作クライアントをダウンロードする
  `https://www.softether-download.com/files/softether/v4.34-9745-rtm-2020.04.05-tree/Windows/SoftEther_VPN_Server_and_VPN_Bridge/softether-vpnserver_vpnbridge-v4.34-9745-rtm-2020.04.05-windows-x86_x64-intel.exe`
- `Softether VPN サーバー管理マネージャー（管理ツールのみ）を選択`
- `新しい接続`を選択
  - ポートは`5555`