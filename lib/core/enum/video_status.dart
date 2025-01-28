import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_status.g.dart';

@HiveType(typeId: 2)
enum VideoStatus {
  @HiveField(0)
  @JsonValue('approved')
  approved,
  @HiveField(1)
  @JsonValue('pending')
  pending,
}

@HiveType(typeId: 3)
enum VideoEncodeStatus {
  @HiveField(0)
  @JsonValue('pending')
  pending,
  @HiveField(1)
  @JsonValue('processing')
  processing,
  @HiveField(2)
  @JsonValue('completed')
  completed,
  @HiveField(3)
  @JsonValue('failed')
  failed,
}
