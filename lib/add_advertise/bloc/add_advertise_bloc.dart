import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class AddAdvertiseBloc extends Bloc<AddAdvertiseEvent, AddAdvertiseState> {

  AddAdvertiseBloc(AddAdvertiseState initialState) : super(initialState);


  @override
  Stream<AddAdvertiseState> mapEventToState(
    AddAdvertiseEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
