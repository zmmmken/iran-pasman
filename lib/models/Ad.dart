import 'package:json_annotation/json_annotation.dart';

part 'Ad.g.dart';

@JsonSerializable()
class Ad{
  String id;
  String title;
  String price;
  String description;
  String phoneNumber;
  String state;
  String city;
  String category;
  String categoryID;
  String subCategory;
  String subCategoryID;
  DateTime time;
  List<String> images;


  Ad({this.id, this.title, this.description, this.phoneNumber, this.state,
      this.city, this.time, this.images,this.category,this.categoryID,this.subCategory,this.subCategoryID});

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  Map<String, dynamic> toJson() => _$AdToJson(this);
}