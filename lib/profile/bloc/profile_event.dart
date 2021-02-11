import 'package:meta/meta.dart';

@immutable
abstract class ProfileEvent {}

class CheckUserIsLogin extends ProfileEvent{}
