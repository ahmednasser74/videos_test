import 'package:an_core_network/an_core_network.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class UserResponseModel extends BaseResponse<UserResponseModel> {
  UserResponseModel();

  @JsonKey(name: 'user_id')
  late final dynamic id;
  @JsonKey(defaultValue: '')
  late final String fullname;
  @JsonKey(defaultValue: '')
  late final String username;
  @JsonKey(defaultValue: '')
  late final String profilePicture;
  @JsonKey(defaultValue: '')
  late final String profilePictureCdn;
  @JsonKey(defaultValue: '')
  late final String designation;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => UserResponseModel.fromJson(json);

  @override
  List<Object?> get props => [
        id,
        fullname,
        username,
        profilePicture,
        profilePictureCdn,
        designation,
      ];
}
