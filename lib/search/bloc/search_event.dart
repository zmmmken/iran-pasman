import 'package:meta/meta.dart';


class MasterSearchEvent{}

class SearchEvent extends MasterSearchEvent{
  final String str;
  final int factor;


  SearchEvent({@required this.str,@required this.factor});

}

class StartTimer extends MasterSearchEvent{
  final String str;
  final int factor;


  StartTimer({@required this.str,@required this.factor});

}

class InitialSearchEvent extends MasterSearchEvent{}
