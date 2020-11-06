// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) {
  return Ad()
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..state = json['state'] as String
    ..city = json['city'] as String
    ..time =
        json['time'] == null ? null : DateTime.parse(json['time'] as String)
    ..images = (json['images'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'phoneNumber': instance.phoneNumber,
      'state': instance.state,
      'city': instance.city,
      'time': instance.time?.toIso8601String(),
      'images': instance.images,
    };
