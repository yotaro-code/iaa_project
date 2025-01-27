import * as protoLoader from "@grpc/proto-loader";
import * as grpc from "@grpc/grpc-js";
import path from "path";

/**
 * Protoファイルをロードして gRPC サービスを初期化
 * @returns gRPC パッケージ定義
 */
export const loadProto = (): any => {
  // .proto ファイルのパス
  const PROTO_PATH = path.resolve(__dirname, "../../proto/audio_service.proto");

  // .proto ファイルのオプションを指定してロード
  const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
    keepCase: true, // フィールド名をそのまま維持
    longs: String, // long 型を文字列として扱う
    enums: String, // enum 型を文字列として扱う
    defaults: true, // デフォルト値を有効にする
    oneofs: true, // oneof フィールドを有効にする
  });

  // gRPC パッケージ定義を返す
  return grpc.loadPackageDefinition(packageDefinition) as any;
};
