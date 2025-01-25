import 'package:an_core_network/an_core_network.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:videos_test/core/const/constants.dart';

part 'get_videos_request_model.g.dart';

@JsonSerializable(createFactory: false)
class GetVideosRequestModel extends RequestModel {
  final int page;
  final int limit;
  final String country;

  GetVideosRequestModel({
    required this.page,
    this.limit = Constants.limit,
    this.country = 'United+States',
    RequestProgressListener? progressListener,
  }) : super(progressListener);

  @override
  Map<String, dynamic> toJson() => _$GetVideosRequestModelToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object?> get props => [page, limit];
}
