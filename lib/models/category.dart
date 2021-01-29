import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category{
  int id;
  String title;

  @JsonSerializable(nullable: true)
  String image;

  @JsonSerializable(nullable: true)
  String description;

  List<Category> childs;


  Category();

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  bool operator ==(other) {
    return (other.id == id);
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;


}