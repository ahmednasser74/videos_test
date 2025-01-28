import 'package:an_core_network/an_core_network.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@HiveType(typeId: 1) // Unique typeId for Hive (different from VideoItemResponseModel)
@JsonSerializable(fieldRename: FieldRename.snake)
class UserResponseModel extends BaseResponse<UserResponseModel> {
  UserResponseModel();

  @HiveField(0)
  @JsonKey(name: 'user_id')
  late final dynamic id;

  @HiveField(1)
  @JsonKey(defaultValue: '')
  late final String fullname;

  @HiveField(2)
  @JsonKey(defaultValue: '')
  late final String username;

  @HiveField(3)
  @JsonKey(defaultValue: '')
  late final String profilePicture;

  @HiveField(4)
  @JsonKey(defaultValue: '')
  late final String profilePictureCdn;

  @HiveField(5)
  @JsonKey(defaultValue: '')
  late final String designation;

  @HiveField(6)
  @JsonKey()
  String? localProfilePicture;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => UserResponseModel.fromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

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
