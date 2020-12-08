import 'package:meta/meta.dart';

import 'my_buy_state.dart';

@immutable
abstract class MyBuyEvent {}

class NavigateAnotherState{
  final MyBuyState state;

  NavigateAnotherState(this.state);

}