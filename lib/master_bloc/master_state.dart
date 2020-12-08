import 'package:meta/meta.dart';

@immutable
abstract class MasterState {}

class InitialMasterState extends MasterState {}

class NetworkError extends MasterState{}

class ShowLoading extends MasterState{}

class NotFound extends MasterState{}
