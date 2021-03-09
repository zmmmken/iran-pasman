import 'package:meta/meta.dart';

@immutable
abstract class MasterState {}

class InitialMasterState extends MasterState {}

class NetworkError extends MasterState{}
class TokenError extends MasterState{}
class OtherError extends MasterState{}

class ShowLoading extends MasterState{}

class NotFound extends MasterState{}

class NoData extends MasterState{}