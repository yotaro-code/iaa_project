import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_agents_ai/repositories/add_agent_repository.dart';
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

// addAgentRepositoryProviderプロバイダー
const String baseUrl =
    'https://asia-northeast1-carbon-crossing-446001-p7.cloudfunctions.net/generateAgents';

final addAgentRepositoryProvider = Provider<AddAgentRepository>((ref) {
  return AddAgentRepository(baseUrl);
});
