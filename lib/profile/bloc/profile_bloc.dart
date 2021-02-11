import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iranpasman/local_storage.dart';
import './bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, InitialProfileState> {
  ProfileBloc(InitialProfileState initialState) : super(initialState);

  Storage _storage = Storage();

  @override
  Stream<InitialProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is CheckUserIsLogin){
      if(userIsLogin())
        yield ShowProfileFeatures();
      else
        yield ShowLoginBtn();
    }
  }

  bool userIsLogin(){
    return _storage.token!= null;
  }

}


