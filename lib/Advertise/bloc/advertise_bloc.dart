import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iranpasman/master_bloc/bloc.dart';
import './bloc.dart';

class AdvertiseBloc extends Bloc<AdvertiseEvent, MasterState> {

  AdvertiseBloc(MasterState initialState) : super(initialState);


  @override
  Stream<MasterState> mapEventToState(
    AdvertiseEvent event,
  ) async* {
    // TODO: Add Logic
}
}
