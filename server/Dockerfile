# Node.js イメージのベースを指定
FROM node:22

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# パッケージファイルを最初にコピーして依存関係をインストール
COPY package*.json ./
RUN npm install

# ソースコードと設定ファイルをコピー
COPY tsconfig.json ./
COPY src ./src
COPY proto ./proto

# TypeScript をコンパイルして dist ディレクトリを生成
RUN npm run build

# ポートを公開
EXPOSE 8080

# サーバーを起動するエントリポイントを指定
CMD ["node", "dist/server.js"]
