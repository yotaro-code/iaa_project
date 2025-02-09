# server_functions（Cloud Run Functions（サーバレス関数））

## はじめに
Cloud Run Functions（サーバレス関数）で利用します。
Cloud Run Functionsを利用できる前程で進めます。

## 動作確認手順
### Firestoreの準備
GCPのプロジェクトに紐づいたFirebaseプロジェクトを作成します。
（GCPとFirebaseが同じプロジェクト名になればOKです。）
次に、firestoreも利用できるように、有効化しましょう。

### .envファイルの作成
server_functionsフォルダ直下に、.envファイルを作成し、以下を記載します。
なお、以下では、各面接官の画像ファイルのURLを記載します。
ご自身が用意した画像のURLに差し替えてください。
（仮で、いらすとやの画像URLを載せています。）

```
GCP_PROJECT_ID=your-project-id

# 一次面接官（男性）
FIRST_INTERVIEWER_1=https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiMeLAEhl-RN1MhKnqRh_Z-4faXFsoRU5TB5ykDAiVyKTgI41_bn7GUgYGCT8BUFruiH3UwbUvAaY6eYIopO-kdCEMQJkc3Ls34hpUos9UGlnC4-cSOCAIqHiK79_qi2nCSd9GuoWziiUiU/s1263/job_kantokukan_man.png
# 一次面接官（女性）
FIRST_INTERVIEWER_2=https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjcihrEXSaDMrepP8ZO0wT1AMUWfhWgD0NmQmgscAsk5oz4D7GBK6ywyVfwATdYv3R7dWpLxKCtRupHnazqjPuvEd0d5HHtn2UhMD80UDZ26lfqFzJJZiskP5LTRgzCfhms13yJbJf3pIxq/s1263/job_kantokukan_woman.png

# 二次面接官（男性）
SECOND_INTERVIEWER_1=https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiMeLAEhl-RN1MhKnqRh_Z-4faXFsoRU5TB5ykDAiVyKTgI41_bn7GUgYGCT8BUFruiH3UwbUvAaY6eYIopO-kdCEMQJkc3Ls34hpUos9UGlnC4-cSOCAIqHiK79_qi2nCSd9GuoWziiUiU/s1263/job_kantokukan_man.png
# 二次面接官（女性）
SECOND_INTERVIEWER_2=https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjcihrEXSaDMrepP8ZO0wT1AMUWfhWgD0NmQmgscAsk5oz4D7GBK6ywyVfwATdYv3R7dWpLxKCtRupHnazqjPuvEd0d5HHtn2UhMD80UDZ26lfqFzJJZiskP5LTRgzCfhms13yJbJf3pIxq/s1263/job_kantokukan_woman.png

# 最終面接官（男性）
FINAL_INTERVIEWER_1=https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiMeLAEhl-RN1MhKnqRh_Z-4faXFsoRU5TB5ykDAiVyKTgI41_bn7GUgYGCT8BUFruiH3UwbUvAaY6eYIopO-kdCEMQJkc3Ls34hpUos9UGlnC4-cSOCAIqHiK79_qi2nCSd9GuoWziiUiU/s1263/job_kantokukan_man.png
# 最終面接官（女性）
FINAL_INTERVIEWER_2=https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjcihrEXSaDMrepP8ZO0wT1AMUWfhWgD0NmQmgscAsk5oz4D7GBK6ywyVfwATdYv3R7dWpLxKCtRupHnazqjPuvEd0d5HHtn2UhMD80UDZ26lfqFzJJZiskP5LTRgzCfhms13yJbJf3pIxq/s1263/job_kantokukan_woman.png

```

### サービスエージェントの作成
Cloud Runのデプロイ時に、サービスアカウントを指定してデプロイします。
以下のロールを付与したサービスアカウントを準備しましょう。

1. **Cloud Run 実行用**
    - `roles/run.invoker`
2. **Cloud Functions 実行用**
    - `roles/cloudfunctions.invoker`
3. **Firestore 操作用**
    - `roles/datastore.user`
4. **Vertex AI (Gemini API) 操作用**
    - `roles/aiplatform.user`

### Cloud Run Functionsへのデプロイ
デプロイします。

まずは、typeScriptをコンパイルします。
```
npx tsc
```

コードをデプロイします。
```
gcloud functions deploy generateAgents \        
  --gen2 \
  --runtime=nodejs22 \
  --region=asia-northeast1 \
  --entry-point=app \
  --trigger-http \
  --service-account=your-service-account@your-project-id.iam.gserviceaccount.com \
  --allow-unauthenticated
```

### 接続テスト
以下のコマンドで、テストエージェントが作成されるのか、試しましょう。アクセスURLは、デプロイしたエンドポイントのURLを指定します。
```
curl -X POST \\n-H "Content-Type: application/json" \\n-d '{"agentName":"testAgent","agentInformation":"This is test info"}' \\nhttps://xxx/generate-agents
```

エージェント情報が、Firestoreの「agents」コレクションに作成されます。
