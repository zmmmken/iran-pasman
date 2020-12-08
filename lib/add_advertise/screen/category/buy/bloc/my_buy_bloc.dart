import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MyBuyBloc extends Bloc<MyBuyEvent, MyBuyState> {
  MyBuyBloc(MyBuyState initialState) : super(initialState);

  @override
  Stream<MyBuyState> mapEventToState(
    MyBuyEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
