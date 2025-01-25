// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_item_response_model.dart';

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
      ..videoAspectRatio = json['video_aspect_ratio'] as String? ?? '9:11';

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
