import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'my_buy_state.dart';

@immutable
abstract class MyBuyEvent {}


class InitialBuyEvent extends MyBuyEvent{
  final context;

  InitialBuyEvent(this.context);
}

class NavigateNextPage extends MyBuyEvent{
  final Widget next;
  final context;
  NavigateNextPage(this.context,this.next);
}


class SelectCategoryEvent extends MyBuyEvent{
  final context;

  SelectCategoryEvent(this.context);
}


class AddToAdvertise extends MyBuyEvent{
  final context;

  AddToAdvertise(this.context);
}