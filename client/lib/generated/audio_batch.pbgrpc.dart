//
//  Generated code. Do not modify.
//  source: audio_batch.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'audio_batch.pb.dart' as $0;

export 'audio_batch.pb.dart';

@$pb.GrpcServiceName('audio.AudioService')
class AudioServiceClient extends $grpc.Client {
  static final _$processAudio = $grpc.ClientMethod<$0.AudioRequest, $0.AudioResponse>(
      '/audio.AudioService/ProcessAudio',
      ($0.AudioRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AudioResponse.fromBuffer(value));
  static final _$initializeSession = $grpc.ClientMethod<$0.InitializeRequest, $0.InitializeResponse>(
      '/audio.AudioService/InitializeSession',
      ($0.InitializeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.InitializeResponse.fromBuffer(value));

  AudioServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.AudioResponse> processAudio($0.AudioRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$processAudio, request, options: options);
  }

  $grpc.ResponseFuture<$0.InitializeResponse> initializeSession($0.InitializeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$initializeSession, request, options: options);
  }
}

@$pb.GrpcServiceName('audio.AudioService')
abstract class AudioServiceBase extends $grpc.Service {
  $core.String get $name => 'audio.AudioService';

  AudioServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AudioRequest, $0.AudioResponse>(
        'ProcessAudio',
        processAudio_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AudioRequest.fromBuffer(value),
        ($0.AudioResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitializeRequest, $0.InitializeResponse>(
        'InitializeSession',
        initializeSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InitializeRequest.fromBuffer(value),
        ($0.InitializeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AudioResponse> processAudio_Pre($grpc.ServiceCall call, $async.Future<$0.AudioRequest> request) async {
    return processAudio(call, await request);
  }

  $async.Future<$0.InitializeResponse> initializeSession_Pre($grpc.ServiceCall call, $async.Future<$0.InitializeRequest> request) async {
    return initializeSession(call, await request);
  }

  $async.Future<$0.AudioResponse> processAudio($grpc.ServiceCall call, $0.AudioRequest request);
  $async.Future<$0.InitializeResponse> initializeSession($grpc.ServiceCall call, $0.InitializeRequest request);
}
