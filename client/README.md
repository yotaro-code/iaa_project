# client(Flutterアプリ)

## はじめに
Flutterでクライアントアプリを作成しています。
* iPhoneでの動作確認をメインで行いました。
* Androidでの動作設定も行いましたが、音声再生・録音等の設定でうまく動作しない可能性があります。
* Webブラウザ上では、gRPCパッケージの制約等から現状は上手く動作しません。
* スマートフォンでの縦画面利用前程の画面を作成しています。

## 動作確認手順

### clientフォルダ直下に.envファイルの作成

事前に、「server」と「server_functions」のデプロイを実施する。
その後、.envファイルに、以下を追加

```
# Cloud RUn gRPC サーバーのURL
GRPC_SERVER_URL=xxx

# Cloud Functions のURL
CLOUD_FUNCTIONS_URL=https://xxx

```

### Firebaseの設定
Firebaseプロジェクトを立ち上げ、clientフォルダ直下で、以下のコマンドを実行。
```
dart pub global activate flutterfire_cli

flutterfire configure --project=carbon-crossing-446001-p7
```

参考手順：
https://firebase.google.com/docs/flutter/setup?hl=ja&platform=ios


### Flutterアプリの起動
main.dartをrunすることで、アプリを起動し、動作を確認できる。
