import 'package:an_core_network/an_core_network.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:videos_test/core/enum/index.dart';

import 'user_response_model.dart';

part 'video_item_response_model.g.dart';

@HiveType(typeId: 0) // Unique typeId for Hive
@JsonSerializable(fieldRename: FieldRename.snake)
class VideoItemResponseModel extends BaseResponse<VideoItemResponseModel> {
  VideoItemResponseModel();

  @HiveField(0)
  late final dynamic id;

  @HiveField(1)
  late final String title;

  @HiveField(2)
  late final String url;

  @HiveField(3)
  late final String cdnUrl;

  @HiveField(4)
  late final String thumbCdnUrl;

  @HiveField(5)
  late final dynamic userId;

  @HiveField(6)
  @JsonKey(unknownEnumValue: VideoStatus.approved)
  late final VideoStatus status;

  @HiveField(7)
  @JsonKey(defaultValue: '')
  late final String slug;

  @HiveField(8)
  @JsonKey(unknownEnumValue: VideoEncodeStatus.pending)
  late final VideoEncodeStatus encodeStatus;

  @HiveField(9)
  @JsonKey(defaultValue: 0)
  late final int priority;

  @HiveField(10)
  late final int categoryId;

  @HiveField(11)
  @JsonKey(defaultValue: 0)
  late final int totalViews;

  @HiveField(12)
  @JsonKey(defaultValue: 0)
  late final int totalLikes;

  @HiveField(13)
  @JsonKey(defaultValue: 0)
  late final int totalComments;

  @HiveField(14)
  @JsonKey(defaultValue: 0)
  late final int totalShare;

  @HiveField(15)
  @JsonKey(defaultValue: 0)
  late final int totalWishlist;

  @HiveField(16)
  late final int duration;

  @HiveField(17)
  late final String byteAddedOn;

  @HiveField(18)
  late final String byteUpdatedOn;

  @HiveField(19)
  late final String bunnyStreamVideoId;

  @HiveField(20)
  @JsonKey(defaultValue: '')
  late final String? bytePlusVideoId;

  @HiveField(21)
  @JsonKey(defaultValue: '')
  late final String? language;

  @HiveField(22)
  @JsonKey(defaultValue: '')
  late final String? orientation;

  @HiveField(23)
  late final int bunnyEncodingStatus;

  @HiveField(24)
  late final String? deletedAt;

  @HiveField(25)
  late final int videoHeight;

  @HiveField(26)
  late final int videoWidth;

  @HiveField(27)
  late final String? location;

  @HiveField(28)
  @JsonKey(defaultValue: 0)
  late final int isPrivate;

  @HiveField(29)
  @JsonKey(defaultValue: 0)
  late final int isHideComment;

  @HiveField(30)
  @JsonKey(defaultValue: '')
  late final String? description;

  @HiveField(31)
  late final UserResponseModel user;

  @HiveField(32)
  @JsonKey(defaultValue: [])
  late final List<String> resolutions;

  @HiveField(33)
  @JsonKey(defaultValue: false)
  late final bool isLiked;

  @HiveField(34)
  @JsonKey(defaultValue: false)
  late final bool isWished;

  @HiveField(35)
  @JsonKey(defaultValue: false)
  late final bool isFollow;

  @HiveField(36)
  @JsonKey(defaultValue: '9:11')
  late final String videoAspectRatio;

  @HiveField(37)
  @JsonKey(name: 'localThumbnailPath')
  String? localThumbnailPath;

  @HiveField(38)
  @JsonKey(name: 'localVideoPath')
  String? localVideoPath;

  factory VideoItemResponseModel.fromJson(Map<String, dynamic> json) => _$VideoItemResponseModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => VideoItemResponseModel.fromJson(json);

  Map<String, dynamic> toJson() => _$VideoItemResponseModelToJson(this);
  //       'id': id,
  //       'title': title,
  //       'url': url,
  //       'cdn_url': cdnUrl,
  //       'thumb_cdn_url': thumbCdnUrl,
  //       'user_id': userId,
  //       'status': _$VideoStatusEnumMap[status]!,
  //       'slug': slug,
  //       'encode_status': _$VideoEncodeStatusEnumMap[encodeStatus]!,
  //       'priority': priority,
  //       'category_id': categoryId,
  //       'total_views': totalViews,
  //       'total_likes': totalLikes,
  //       'total_comments': totalComments,
  //       'total_share': totalShare,
  //       'total_wishlist': totalWishlist,
  //       'duration': duration,
  //       'byte_added_on': byteAddedOn,
  //       'byte_updated_on': byteUpdatedOn,
  //       'bunny_stream_video_id': bunnyStreamVideoId,
  //       'byte_plus_video_id': bytePlusVideoId,
  //       'language': language,
  //       'orientation': orientation,
  //       'bunny_encoding_status': bunnyEncodingStatus,
  //       'deleted_at': deletedAt,
  //       'video_height': videoHeight,
  //       'video_width': videoWidth,
  //       'location': location,
  //       'is_private': isPrivate,
  //       'is_hide_comment': isHideComment,
  //       'description': description,
  //       'user': user.toJson(),
  //       'resolutions': resolutions,
  //       'is_liked': isLiked,
  //       'is_wished': isWished,
  //       'is_follow': isFollow,
  //       'video_aspect_ratio': videoAspectRatio,
  //       'localThumbnailPath': localThumbnailPath,
  //       'localVideoPath': localVideoPath,
  //     };

  @override
  List<Object?> get props => [
        id,
        title,
        url,
        cdnUrl,
        thumbCdnUrl,
        userId,
        status,
        slug,
        encodeStatus,
        priority,
        categoryId,
        totalViews,
        totalLikes,
        totalComments,
        totalShare,
        totalWishlist,
        duration,
        byteAddedOn,
        byteUpdatedOn,
        bunnyStreamVideoId,
        bytePlusVideoId,
        language,
        orientation,
        bunnyEncodingStatus,
        deletedAt,
        videoHeight,
        videoWidth,
        location,
        isPrivate,
        isHideComment,
        description,
        user,
        resolutions,
        isLiked,
        isWished,
        isFollow,
        videoAspectRatio
      ];
}
