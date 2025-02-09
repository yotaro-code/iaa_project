# server(Cloud Run で動作するサーバー)

## はじめに
Cloud Runでデプロイして利用します。
Cloud Runを利用できる前程で進めます。

## 動作確認手順
### firestoreにエージェント情報の準備
firestoreにエージェント情報を登録します。
具体的には、「server_functions（Cloud Run Functions（サーバレス関数））」で登録できます。

### .envファイルの作成
serverフォルダ直下に、.envファイルを作成し、以下を記載します。

```
GRPC_PORT=8080
FIRESTORE_EMULATOR_HOST=localhost:8080
GCP_PROJECT_ID=your-project-id

```

### サービスエージェントの作成
Cloud Runのデプロイ時に、サービスアカウントを指定してデプロイします。
以下のロールを付与したサービスアカウントを準備しましょう。
1. **Cloud Run 実行用**
    - `roles/run.invoker`
2. **Firestore 操作用**
    - `roles/datastore.user`
3. **Text-to-Speech 操作用**
    - `roles/texttospeech.user`
4. **Speech-to-Text 操作用**
    - `roles/speech.user`
5. **Vertex AI (Gemini API) 操作用**
    - `roles/aiplatform.user`

### Cloud Runへのデプロイ
コンテナイメージを作成し、デプロイします。

まずは、typeScriptをコンパイルします。
```
npx tsc
```

コンテナイメージの作成

```
gcloud builds submit --tag gcr.io/your-project-id/interview-agents
```

コンテナイメージをCloud Runへデプロイ
```
gcloud run deploy interview-agents \                                        
    --image gcr.io/your-project-id/interview-agents \
    --platform managed \
    --region asia-northeast1 \
    --service-account your-service-account@your-project-id.iam.gserviceaccount.com \
    --allow-unauthenticated
```

### 接続テスト
「test」フォルダ配下にある、以下のコードを試してみましょう。
* test_InitializeSession_cloudrunClient.ts
* test_ProcessAudio_cloudrunClient.ts

agentIdは、事前にfirestoreに登録されたagentIdを利用します。
