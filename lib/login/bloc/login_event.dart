import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {}

class SendCode extends LoginEvent{
  String phoneNumber;
  BuildContext context;

  SendCode({this.phoneNumber,this.context});

}

