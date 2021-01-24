import 'package:json_annotation/json_annotation.dart';

part 'base_result.g.dart';

@JsonSerializable()
class BaseResponse{
  String msg;
  bool status;

  var data;


  BaseResponse();

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

}