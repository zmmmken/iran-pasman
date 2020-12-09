import 'package:meta/meta.dart';

import 'my_buy_state.dart';

@immutable
abstract class MyBuyEvent {}

class NavigateAnotherState extends MyBuyEvent{
  final MyBuyState state;

  NavigateAnotherState(this.state);

}