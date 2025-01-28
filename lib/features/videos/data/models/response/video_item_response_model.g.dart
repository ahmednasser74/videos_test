// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_item_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoItemResponseModelAdapter extends TypeAdapter<VideoItemResponseModel> {
  @override
  final int typeId = 0;

  @override
  VideoItemResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoItemResponseModel()
      ..id = fields[0] as dynamic
      ..title = fields[1] as String
      ..url = fields[2] as String
      ..cdnUrl = fields[3] as String
      ..thumbCdnUrl = fields[4] as String
      ..userId = fields[5] as dynamic
      ..status = fields[6] as VideoStatus
      ..slug = fields[7] as String
      ..encodeStatus = fields[8] as VideoEncodeStatus
      ..priority = fields[9] as int
      ..categoryId = fields[10] as int
      ..totalViews = fields[11] as int
      ..totalLikes = fields[12] as int
      ..totalComments = fields[13] as int
      ..totalShare = fields[14] as int
      ..totalWishlist = fields[15] as int
      ..duration = fields[16] as int
      ..byteAddedOn = fields[17] as String
      ..byteUpdatedOn = fields[18] as String
      ..bunnyStreamVideoId = fields[19] as String
      ..bytePlusVideoId = fields[20] as String?
      ..language = fields[21] as String?
      ..orientation = fields[22] as String?
      ..bunnyEncodingStatus = fields[23] as int
      ..deletedAt = fields[24] as String?
      ..videoHeight = fields[25] as int
      ..videoWidth = fields[26] as int
      ..location = fields[27] as String?
      ..isPrivate = fields[28] as int
      ..isHideComment = fields[29] as int
      ..description = fields[30] as String?
      ..user = fields[31] as UserResponseModel
      ..resolutions = (fields[32] as List).cast<String>()
      ..isLiked = fields[33] as bool
      ..isWished = fields[34] as bool
      ..isFollow = fields[35] as bool
      ..videoAspectRatio = fields[36] as String
      ..localThumbnailPath = fields[37] as String?
      ..localVideoPath = fields[38] as String?;
  }

  @override
  void write(BinaryWriter writer, VideoItemResponseModel obj) {
    writer
      ..writeByte(39)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.cdnUrl)
      ..writeByte(4)
      ..write(obj.thumbCdnUrl)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.slug)
      ..writeByte(8)
      ..write(obj.encodeStatus)
      ..writeByte(9)
      ..write(obj.priority)
      ..writeByte(10)
      ..write(obj.categoryId)
      ..writeByte(11)
      ..write(obj.totalViews)
      ..writeByte(12)
      ..write(obj.totalLikes)
      ..writeByte(13)
      ..write(obj.totalComments)
      ..writeByte(14)
      ..write(obj.totalShare)
      ..writeByte(15)
      ..write(obj.totalWishlist)
      ..writeByte(16)
      ..write(obj.duration)
      ..writeByte(17)
      ..write(obj.byteAddedOn)
      ..writeByte(18)
      ..write(obj.byteUpdatedOn)
      ..writeByte(19)
      ..write(obj.bunnyStreamVideoId)
      ..writeByte(20)
      ..write(obj.bytePlusVideoId)
      ..writeByte(21)
      ..write(obj.language)
      ..writeByte(22)
      ..write(obj.orientation)
      ..writeByte(23)
      ..write(obj.bunnyEncodingStatus)
      ..writeByte(24)
      ..write(obj.deletedAt)
      ..writeByte(25)
      ..write(obj.videoHeight)
      ..writeByte(26)
      ..write(obj.videoWidth)
      ..writeByte(27)
      ..write(obj.location)
      ..writeByte(28)
      ..write(obj.isPrivate)
      ..writeByte(29)
      ..write(obj.isHideComment)
      ..writeByte(30)
      ..write(obj.description)
      ..writeByte(31)
      ..write(obj.user)
      ..writeByte(32)
      ..write(obj.resolutions)
      ..writeByte(33)
      ..write(obj.isLiked)
      ..writeByte(34)
      ..write(obj.isWished)
      ..writeByte(35)
      ..write(obj.isFollow)
      ..writeByte(36)
      ..write(obj.videoAspectRatio)
      ..writeByte(37)
      ..write(obj.localThumbnailPath)
      ..writeByte(38)
      ..write(obj.localVideoPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VideoItemResponseModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoItemResponseModel _$VideoItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    VideoItemResponseModel()
      ..id = json['id']
      ..title = json['title'] as String
      ..url = json['url'] as String
      ..cdnUrl = json['cdn_url'] as String
      ..thumbCdnUrl = json['thumb_cdn_url'] as String
      ..userId = json['user_id']
      ..status = $enumDecode(_$VideoStatusEnumMap, json['status'],
          unknownValue: VideoStatus.approved)
      ..slug = json['slug'] as String? ?? ''
      ..encodeStatus = $enumDecode(
          _$VideoEncodeStatusEnumMap, json['encode_status'],
          unknownValue: VideoEncodeStatus.pending)
      ..priority = (json['priority'] as num?)?.toInt() ?? 0
      ..categoryId = (json['category_id'] as num).toInt()
      ..totalViews = (json['total_views'] as num?)?.toInt() ?? 0
      ..totalLikes = (json['total_likes'] as num?)?.toInt() ?? 0
      ..totalComments = (json['total_comments'] as num?)?.toInt() ?? 0
      ..totalShare = (json['total_share'] as num?)?.toInt() ?? 0
      ..totalWishlist = (json['total_wishlist'] as num?)?.toInt() ?? 0
      ..duration = (json['duration'] as num).toInt()
      ..byteAddedOn = json['byte_added_on'] as String
      ..byteUpdatedOn = json['byte_updated_on'] as String
      ..bunnyStreamVideoId = json['bunny_stream_video_id'] as String
      ..bytePlusVideoId = json['byte_plus_video_id'] as String? ?? ''
      ..language = json['language'] as String? ?? ''
      ..orientation = json['orientation'] as String? ?? ''
      ..bunnyEncodingStatus = (json['bunny_encoding_status'] as num).toInt()
      ..deletedAt = json['deleted_at'] as String?
      ..videoHeight = (json['video_height'] as num).toInt()
      ..videoWidth = (json['video_width'] as num).toInt()
      ..location = json['location'] as String?
      ..isPrivate = (json['is_private'] as num?)?.toInt() ?? 0
      ..isHideComment = (json['is_hide_comment'] as num?)?.toInt() ?? 0
      ..description = json['description'] as String? ?? ''
      ..user = UserResponseModel.fromJson(json['user'] as Map<String, dynamic>)
      ..resolutions = (json['resolutions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          []
      ..isLiked = json['is_liked'] as bool? ?? false
      ..isWished = json['is_wished'] as bool? ?? false
      ..isFollow = json['is_follow'] as bool? ?? false
  ..videoAspectRatio = json['video_aspect_ratio'] as String? ?? '9:11'
  ..localThumbnailPath = json['localThumbnailPath'] as String?
  ..localVideoPath = json['localVideoPath'] as String?;

Map<String, dynamic> _$VideoItemResponseModelToJson(VideoItemResponseModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'cdn_url': instance.cdnUrl,
      'thumb_cdn_url': instance.thumbCdnUrl,
      'user_id': instance.userId,
      'status': _$VideoStatusEnumMap[instance.status]!,
      'slug': instance.slug,
      'encode_status': _$VideoEncodeStatusEnumMap[instance.encodeStatus]!,
      'priority': instance.priority,
      'category_id': instance.categoryId,
      'total_views': instance.totalViews,
      'total_likes': instance.totalLikes,
      'total_comments': instance.totalComments,
      'total_share': instance.totalShare,
      'total_wishlist': instance.totalWishlist,
      'duration': instance.duration,
      'byte_added_on': instance.byteAddedOn,
      'byte_updated_on': instance.byteUpdatedOn,
      'bunny_stream_video_id': instance.bunnyStreamVideoId,
      'byte_plus_video_id': instance.bytePlusVideoId,
      'language': instance.language,
      'orientation': instance.orientation,
      'bunny_encoding_status': instance.bunnyEncodingStatus,
      'deleted_at': instance.deletedAt,
      'video_height': instance.videoHeight,
      'video_width': instance.videoWidth,
      'location': instance.location,
      'is_private': instance.isPrivate,
      'is_hide_comment': instance.isHideComment,
      'description': instance.description,
      'user': instance.user.toJson(),
      'resolutions': instance.resolutions,
      'is_liked': instance.isLiked,
      'is_wished': instance.isWished,
      'is_follow': instance.isFollow,
      'video_aspect_ratio': instance.videoAspectRatio,
      'localThumbnailPath': instance.localThumbnailPath,
      'localVideoPath': instance.localVideoPath,
    };

const _$VideoStatusEnumMap = {
  VideoStatus.approved: 'approved',
  VideoStatus.pending: 'pending',
};

const _$VideoEncodeStatusEnumMap = {
  VideoEncodeStatus.pending: 'pending',
  VideoEncodeStatus.processing: 'processing',
  VideoEncodeStatus.completed: 'completed',
  VideoEncodeStatus.failed: 'failed',
};
