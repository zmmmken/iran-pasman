import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VerifyEvent {}

class VerifyCode extends VerifyEvent{
  String phoneNumber;
  String code;
  BuildContext context;

  VerifyCode({this.phoneNumber, this.code,this.context});

}