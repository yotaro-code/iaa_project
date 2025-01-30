import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  // コレクション全体を取得
  Future<QuerySnapshot> getCollection(String collectionPath) async {
    return _firestore
        .collection(collectionPath)
        .orderBy('lastUpdated', descending: true) // `lastUpdated` の新しい順に取得
        .get();
    ;
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

  // Streamコレクション全体を取得
  Stream<QuerySnapshot> streamCollection(String collectionPath) {
    return _firestore
        .collection(collectionPath)
        .orderBy('lastUpdated', descending: true)
        .snapshots();
  }

  // Streamドキュメントを取得
  Stream<DocumentSnapshot> streamDocument(String documentPath) {
    return _firestore.doc(documentPath).snapshots();
  }
}
