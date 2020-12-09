import 'package:iranpasman/models/Ad.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState {}

class InitialSearchState extends SearchState {}

class Empty extends SearchState{}
class RequestLoading extends SearchState{}

class RequestRejected extends SearchState{}
class TypingSearchState extends SearchState{}

class Loaded extends SearchState{
  final List<Ad> models;
  Loaded({@required this.models});

}

