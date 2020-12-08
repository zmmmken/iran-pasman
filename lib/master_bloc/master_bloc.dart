import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  MasterBloc(MasterState initialState) : super(initialState);

  @override
  MasterState get initialState => InitialMasterState();

  @override
  Stream<MasterState> mapEventToState(
    MasterEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
