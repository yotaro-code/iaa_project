import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  // コレクション全体を取得
  Future<QuerySnapshot> getCollection(String collectionPath) async {
    return _firestore.collection(collectionPath).get();
  }

  // ドキュメントを取得
  Future<DocumentSnapshot> getDocument(String documentPath) async {
    return _firestore.doc(documentPath).get();
  }

  // ドキュメントを追加
  Future<DocumentReference> addDocument(
      String collectionPath, Map<String, dynamic> data) async {
    return _firestore.collection(collectionPath).add(data);
  }

  // ドキュメントを更新
  Future<void> updateDocument(
      String documentPath, Map<String, dynamic> data) async {
    return _firestore.doc(documentPath).update(data);
  }

  // ドキュメントを削除
  Future<void> deleteDocument(String documentPath) async {
    return _firestore.doc(documentPath).delete();
  }
}
