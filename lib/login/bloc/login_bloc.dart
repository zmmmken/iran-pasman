import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/master_bloc/bloc.dart';
import 'package:iranpasman/models/base_result.dart';
import 'package:iranpasman/network.dart';
import 'package:iranpasman/varify_number/vrewifyNumberScreen.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, MasterState> {
  LoginBloc(MasterState initialState) : super(initialState);

  @override
  Stream<MasterState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SendCode) {
      yield ShowLoading();

      NetworkProvider provider =
          RepositoryProvider.of<NetworkProvider>(event.context);
      try {
        BaseResponse response = await provider.login(event.phoneNumber);
        if (response.status) {
          Navigator.of(event.context).push(MaterialPageRoute(
              builder: (context) => VerifyNumberScreen(
                    phoneNumber: event.phoneNumber,
                  )));
        } else {
          yield InitialLoginState();
        }
      } catch (e) {
        yield InitialLoginState();
      }
    }
  }
}
