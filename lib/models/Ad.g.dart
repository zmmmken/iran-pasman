// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) {
  return Ad(
    id: json['id'] as int,
    title: json['title'] as String,
    price: json['price'] as String,
    type: json['type'] as String,
    description: json['description'] as String,
    phoneNumber: json['phone'] as String,
    mobile: json['mobile'] as String,
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    state: json['state'] == null
        ? null
        : City.fromJson(json['state'] as Map<String, dynamic>),
    category: json['category'] as String,
    categoryID: json['categoryID'] as String,
    subCategory: json['subCategory'] as String,
    subCategoryID: json['subCategoryID'] as String,
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    remind: json['remind'] as String,
    level: json['level'] as String,
    priceUnit: json['priceUnit'] == null
        ? null
        : ValueUnit.fromJson(json['priceUnit'] as Map<String, dynamic>),
    valueUnit: json['valueUnit'] == null
        ? null
        : ValueUnit.fromJson(json['valueUnit'] as Map<String, dynamic>),
    startDate: json['start_date'] as String,
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'type': instance.type,
      'description': instance.description,
      'phone': instance.phoneNumber,
      'mobile': instance.mobile,
      'city': instance.city,
      'state': instance.state,
      'category': instance.category,
      'categoryID': instance.categoryID,
      'subCategory': instance.subCategory,
      'subCategoryID': instance.subCategoryID,
      'time': instance.time?.toIso8601String(),
      'remind': instance.remind,
      'level': instance.level,
      'priceUnit': instance.priceUnit,
      'valueUnit': instance.valueUnit,
      'start_date': instance.startDate,
      'images': instance.images,
    };
