import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  MainBloc(MainState initialState) : super(initialState);

  Map<int,MainState> bottomItems = {
    0: HomeState(),
    1: SearchState(),
    3: AlertState(),
    4: ProfileState(),
  };

  int selectedState = 0;

  @override
  MainState get initialState => HomeState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if(event is ChangeState){
      selectedState = event.state;
      yield bottomItems[event.state];
    }
  }
}
