import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/grpc_service.dart';
import 'agent_repository.dart';
import '../services/firestore_service.dart';
import 'feedback_repository.dart';
import 'interview_repository.dart';

// FirestoreServiceプロバイダー
final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService(FirebaseFirestore.instance);
});

// GrpcServiceプロバイダー
final grpcServiceProvider = Provider<GrpcService>((ref) {
  return GrpcService(
      'ai-interview-agents-63162381056.asia-northeast1.run.app'); // サーバーのホスト名を指定
});

// AgentRepositoryプロバイダー
final agentRepositoryProvider = Provider<AgentRepository>((ref) {
  final firestoreService = ref.read(firestoreServiceProvider);
  return AgentRepository(firestoreService);
});

// InterviewRepositoryプロバイダー
final interviewRepositoryProvider = Provider<InterviewRepository>((ref) {
  final grpcService = ref.read(grpcServiceProvider);
  return InterviewRepository(grpcService);
});

// FeedbackRepositoryプロバイダー
final feedbackRepositoryProvider = Provider<FeedbackRepository>((ref) {
  final firestoreService = ref.read(firestoreServiceProvider);
  return FeedbackRepository(firestoreService);
});
