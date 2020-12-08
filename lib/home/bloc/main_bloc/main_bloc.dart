import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  MainBloc(MainState initialState) : super(initialState);

  @override
  MainState get initialState => HomeState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if(event is ChangeState){
      yield event.state;
    }
  }
}
