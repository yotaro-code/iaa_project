//
//  Generated code. Do not modify.
//  source: audio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use initializeRequestDescriptor instead')
const InitializeRequest$json = {
  '1': 'InitializeRequest',
  '2': [
    {'1': 'agentId', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `InitializeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initializeRequestDescriptor = $convert.base64Decode(
    'ChFJbml0aWFsaXplUmVxdWVzdBIYCgdhZ2VudElkGAEgASgJUgdhZ2VudElkEhYKBnVzZXJJZB'
    'gCIAEoCVIGdXNlcklk');

@$core.Deprecated('Use initializeResponseDescriptor instead')
const InitializeResponse$json = {
  '1': 'InitializeResponse',
  '2': [
    {'1': 'sessionId', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'initialAudioData', '3': 2, '4': 1, '5': 12, '10': 'initialAudioData'},
  ],
};

/// Descriptor for `InitializeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initializeResponseDescriptor = $convert.base64Decode(
    'ChJJbml0aWFsaXplUmVzcG9uc2USHAoJc2Vzc2lvbklkGAEgASgJUglzZXNzaW9uSWQSKgoQaW'
    '5pdGlhbEF1ZGlvRGF0YRgCIAEoDFIQaW5pdGlhbEF1ZGlvRGF0YQ==');

@$core.Deprecated('Use audioRequestDescriptor instead')
const AudioRequest$json = {
  '1': 'AudioRequest',
  '2': [
    {'1': 'sessionId', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'agentId', '3': 2, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'currentRound', '3': 4, '4': 1, '5': 5, '10': 'currentRound'},
    {'1': 'audioData', '3': 5, '4': 1, '5': 12, '10': 'audioData'},
  ],
};

/// Descriptor for `AudioRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioRequestDescriptor = $convert.base64Decode(
    'CgxBdWRpb1JlcXVlc3QSHAoJc2Vzc2lvbklkGAEgASgJUglzZXNzaW9uSWQSGAoHYWdlbnRJZB'
    'gCIAEoCVIHYWdlbnRJZBIWCgZ1c2VySWQYAyABKAlSBnVzZXJJZBIiCgxjdXJyZW50Um91bmQY'
    'BCABKAVSDGN1cnJlbnRSb3VuZBIcCglhdWRpb0RhdGEYBSABKAxSCWF1ZGlvRGF0YQ==');

@$core.Deprecated('Use audioResponseDescriptor instead')
const AudioResponse$json = {
  '1': 'AudioResponse',
  '2': [
    {'1': 'audioData', '3': 1, '4': 1, '5': 12, '10': 'audioData'},
  ],
};

/// Descriptor for `AudioResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioResponseDescriptor = $convert.base64Decode(
    'Cg1BdWRpb1Jlc3BvbnNlEhwKCWF1ZGlvRGF0YRgBIAEoDFIJYXVkaW9EYXRh');

