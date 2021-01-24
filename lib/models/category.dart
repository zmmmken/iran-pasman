import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category{
  int id;
  String title;
  String key;

  @JsonSerializable(nullable: true)
  String image;

  @JsonSerializable(nullable: true)
  String description;



  Category();

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

}