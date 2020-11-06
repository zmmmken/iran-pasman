import 'package:meta/meta.dart';

@immutable
abstract class MainState {}

class HomeState extends MainState {}

class AddAdvertiseState extends MainState {}

class SearchState extends MainState {}

class AlertState extends MainState {}

class ProfileState extends MainState {}

class LoadingState extends MainState {}

class ErrorState extends MainState {}

class ServerError extends ErrorState{}

class NotFound extends ErrorState{}

class ConnectivityError extends ErrorState{}