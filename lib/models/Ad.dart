import 'package:json_annotation/json_annotation.dart';

part 'Ad.g.dart';

@JsonSerializable()
class Ad{
  String title;
  String description;
  String phoneNumber;
  String state;
  String city;
  DateTime time;
  List<String> images;

  Ad();

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  Map<String, dynamic> toJson() => _$AdToJson(this);
}