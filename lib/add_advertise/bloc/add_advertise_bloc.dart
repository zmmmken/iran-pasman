import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/bloc/bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/screen_one.dart';
import 'package:iranpasman/master_bloc/master_state.dart';
import 'package:iranpasman/models/ad_types.dart';
import 'package:iranpasman/widgets/base_widget.dart';
import 'bloc.dart';

class AddAdvertiseBloc extends Bloc<AddAdvertiseEvent, AddAdvertiseState> {
  AddAdvertiseBloc(AddAdvertiseState initialState) : super(initialState);

  @override
  Stream<AddAdvertiseState> mapEventToState(
    AddAdvertiseEvent event,
  ) async* {
    if (event is NavigateAnotherState) {
      Navigator.of(event.context).push(MaterialPageRoute(builder: (context) {
        return BlocProvider(
            create: (context) => MyBuyBloc(ShowLoading(), event.state,
                event.state == AdTypes.BUY ? "آکهی خرید" : "آگهی فروش"),
            child: FirstBuyScreen());
      }));
    }
    // TODO: Add Logic
  }
}
