import 'package:json_annotation/json_annotation.dart';

enum VideoStatus {
  @JsonValue('approved')
  approved,
  @JsonValue('pending')
  pending,
}

enum VideoEncodeStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('processing')
  processing,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
}
