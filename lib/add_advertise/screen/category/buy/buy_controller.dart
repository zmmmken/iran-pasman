import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/bloc/my_buy_bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/bloc/my_buy_state.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/screen_one.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/second_screen.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/third_screen.dart';
import './bloc/bloc.dart';
class BuyController extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _bloc = MyBuyBloc(FirstStateBuy());

    return BlocBuilder(
        cubit: _bloc,
        builder: (context,state){
          if(state is FirstStateBuy){
            return FirstBuyScreen();
          }else if(state is SecondStateBuy){
            return SecondBuyScreen();
          }else if(state is ThirdStateBuy){
            return ThirdBuyScreen();
          }else
            return Container();
        });
  }
}
