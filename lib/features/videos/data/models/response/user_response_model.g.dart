// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

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
      ..designation = json['designation'] as String? ?? '';
