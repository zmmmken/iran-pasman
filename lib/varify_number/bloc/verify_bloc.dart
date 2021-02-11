import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/local_storage.dart';
import 'package:iranpasman/master_bloc/master_state.dart';
import 'package:iranpasman/models/base_result.dart';
import 'package:iranpasman/network.dart';
import 'package:iranpasman/select_state.dart';
import '../vrewifyNumberScreen.dart';
import './bloc.dart';

class VerifyBloc extends Bloc<VerifyEvent, MasterState> {

  VerifyBloc(MasterState initialState) : super(initialState);


  @override
  Stream<MasterState> mapEventToState(
    VerifyEvent event,
  ) async* {
    if (event is VerifyCode) {
      yield ShowLoading();
      NetworkProvider provider =
      RepositoryProvider.of<NetworkProvider>(event.context);
      try {
        BaseResponse response = await provider.verify(event.phoneNumber,event.code);
        Storage storage = new Storage();
        storage.token = response.data["token"];
        if (response.status) {
          Navigator.of(event.context).push(MaterialPageRoute(
              builder: (context) => SelectState()));
        } else {
          yield InitialVerifyState();
        }
      } catch (e) {
        yield InitialVerifyState();
      }
    }
  }
}
