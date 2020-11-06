import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  String phoneNumber;
  String token;
  String name;
  String lastName;


  User({this.phoneNumber, this.token, this.name, this.lastName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}