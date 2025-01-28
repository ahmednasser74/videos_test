// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserResponseModelAdapter extends TypeAdapter<UserResponseModel> {
  @override
  final int typeId = 1;

  @override
  UserResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserResponseModel()
      ..id = fields[0] as dynamic
      ..fullname = fields[1] as String
      ..username = fields[2] as String
      ..profilePicture = fields[3] as String
      ..profilePictureCdn = fields[4] as String
      ..designation = fields[5] as String
      ..localProfilePicture = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, UserResponseModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullname)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.profilePicture)
      ..writeByte(4)
      ..write(obj.profilePictureCdn)
      ..writeByte(5)
      ..write(obj.designation)
      ..writeByte(6)
      ..write(obj.localProfilePicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel()
      ..id = json['user_id']
      ..fullname = json['fullname'] as String? ?? ''
      ..username = json['username'] as String? ?? ''
      ..profilePicture = json['profile_picture'] as String? ?? ''
      ..profilePictureCdn = json['profile_picture_cdn'] as String? ?? ''
      ..designation = json['designation'] as String? ?? ''
      ..localProfilePicture = json['local_profile_picture'] as String?;

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'fullname': instance.fullname,
      'username': instance.username,
      'profile_picture': instance.profilePicture,
      'profile_picture_cdn': instance.profilePictureCdn,
      'designation': instance.designation,
      'local_profile_picture': instance.localProfilePicture,
    };
