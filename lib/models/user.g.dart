// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    phoneNumber: json['phoneNumber'] as String,
    token: json['token'] as String,
    name: json['name'] as String,
    lastName: json['lastName'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'token': instance.token,
      'name': instance.name,
      'lastName': instance.lastName,
    };
