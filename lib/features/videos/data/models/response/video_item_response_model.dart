import 'package:an_core_network/an_core_network.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:videos_test/core/enum/index.dart';

import 'user_response_model.dart';

part 'video_item_response_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class VideoItemResponseModel extends BaseResponse<VideoItemResponseModel> {
  VideoItemResponseModel();
  late final dynamic id;
  late final String title;
  late final String url;
  late final String cdnUrl;
  late final String thumbCdnUrl;
  late final dynamic userId;
  @JsonKey(unknownEnumValue: VideoStatus.approved)
  late final VideoStatus status;
  @JsonKey(defaultValue: '')
  late final String slug;
  @JsonKey(unknownEnumValue: VideoEncodeStatus.pending)
  late final VideoEncodeStatus encodeStatus;
  @JsonKey(defaultValue: 0)
  late final int priority;
  late final int categoryId;
  @JsonKey(defaultValue: 0)
  late final int totalViews;
  @JsonKey(defaultValue: 0)
  late final int totalLikes;
  @JsonKey(defaultValue: 0)
  late final int totalComments;
  @JsonKey(defaultValue: 0)
  late final int totalShare;
  @JsonKey(defaultValue: 0)
  late final int totalWishlist;
  late final int duration;
  late final String byteAddedOn;
  late final String byteUpdatedOn;
  late final String bunnyStreamVideoId;
  @JsonKey(defaultValue: '')
  late final String? bytePlusVideoId;
  @JsonKey(defaultValue: '')
  late final String? language;
  @JsonKey(defaultValue: '')
  late final String? orientation;
  late final int bunnyEncodingStatus;
  late final String? deletedAt;
  late final int videoHeight;
  late final int videoWidth;
  late final String? location;
  @JsonKey(defaultValue: 0)
  late final int isPrivate;
  @JsonKey(defaultValue: 0)
  late final int isHideComment;
  @JsonKey(defaultValue: '')
  late final String? description;
  late final UserResponseModel user;
  @JsonKey(defaultValue: [])
  late final List<String> resolutions;
  @JsonKey(defaultValue: false)
  late final bool isLiked;
  @JsonKey(defaultValue: false)
  late final bool isWished;
  @JsonKey(defaultValue: false)
  late final bool isFollow;
  @JsonKey(defaultValue: '9:11')
  late final String videoAspectRatio;

  factory VideoItemResponseModel.fromJson(Map<String, dynamic> json) => _$VideoItemResponseModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => VideoItemResponseModel.fromJson(json);

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
