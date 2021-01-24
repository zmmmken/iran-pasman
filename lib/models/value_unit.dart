import 'package:json_annotation/json_annotation.dart';

part 'value_unit.g.dart';

@JsonSerializable()
class ValueUnit{

  String title;
  int id;


  ValueUnit();

  factory ValueUnit.fromJson(Map<String, dynamic> json) => _$ValueUnitFromJson(json);

  Map<String, dynamic> toJson() => _$ValueUnitToJson(this);

}