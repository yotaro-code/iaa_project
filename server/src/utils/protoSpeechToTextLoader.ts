import * as path from "path";
import * as protoLoader from "@grpc/proto-loader";
import * as grpc from "@grpc/grpc-js";

/**
 * Protoファイルをロードして gRPC サービスを初期化
 * @param protoPath プロトコルバッファ（.protoファイル）のパス
 * @returns gRPC パッケージ定義
 */
export const loadProto = (protoPath: string) => {
  const packageDefinition = protoLoader.loadSync(protoPath, {
    keepCase: true, // フィールド名をそのまま維持
    longs: String, // long 型を文字列として扱う
    enums: String, // enum 型を文字列として扱う
    defaults: true, // デフォルト値を有効にする
    oneofs: true, // oneof フィールドを有効にする
  });

  return grpc.loadPackageDefinition(packageDefinition);
};
