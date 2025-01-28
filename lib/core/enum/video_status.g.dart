// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoStatusAdapter extends TypeAdapter<VideoStatus> {
  @override
  final int typeId = 2;

  @override
  VideoStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VideoStatus.approved;
      case 1:
        return VideoStatus.pending;
      default:
        return VideoStatus.approved;
    }
  }

  @override
  void write(BinaryWriter writer, VideoStatus obj) {
    switch (obj) {
      case VideoStatus.approved:
        writer.writeByte(0);
        break;
      case VideoStatus.pending:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VideoEncodeStatusAdapter extends TypeAdapter<VideoEncodeStatus> {
  @override
  final int typeId = 3;

  @override
  VideoEncodeStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VideoEncodeStatus.pending;
      case 1:
        return VideoEncodeStatus.processing;
      case 2:
        return VideoEncodeStatus.completed;
      case 3:
        return VideoEncodeStatus.failed;
      default:
        return VideoEncodeStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, VideoEncodeStatus obj) {
    switch (obj) {
      case VideoEncodeStatus.pending:
        writer.writeByte(0);
        break;
      case VideoEncodeStatus.processing:
        writer.writeByte(1);
        break;
      case VideoEncodeStatus.completed:
        writer.writeByte(2);
        break;
      case VideoEncodeStatus.failed:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoEncodeStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
