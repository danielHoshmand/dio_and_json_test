// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleUserResponse _$SingleUserResponseFromJson(Map<String, dynamic> json) =>
    SingleUserResponse(
      User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleUserResponseToJson(SingleUserResponse instance) =>
    <String, dynamic>{
      'data': instance.user,
    };
