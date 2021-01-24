import 'package:iranpasman/models/city.dart';
import 'package:iranpasman/models/value_unit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Ad.g.dart';

@JsonSerializable()
class Ad{
  int id;
  String title;
  String price;
  String type;
  String description;

  @JsonKey(name: 'phone')
  String phoneNumber;

  String mobile;

  City city;
  City state;
  String category;
  String categoryID;
  String subCategory;
  String subCategoryID;
  DateTime time;
  String remind;
  String level;

  @JsonSerializable(nullable: true)
  ValueUnit priceUnit;
  @JsonSerializable(nullable: true)
  ValueUnit valueUnit;

  @JsonKey(name: 'start_date')
  String startDate;

  @JsonSerializable(nullable: true)
  List<String> images;


  Ad({this.id, this.title, this.price, this.type, this.description,
      this.phoneNumber, this.mobile, this.city, this.state, this.category,
      this.categoryID, this.subCategory, this.subCategoryID, this.time,
      this.remind, this.level, this.priceUnit, this.valueUnit, this.startDate,
      this.images});

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  Map<String, dynamic> toJson() => _$AdToJson(this);
}