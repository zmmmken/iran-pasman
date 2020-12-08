import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iranpasman/add_advertise/bloc/bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/buy_controller.dart';
import 'package:iranpasman/add_advertise/screen/category/select_category.dart';

class AddAdvertiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = AddAdvertiseBloc(MasterBuyState());
    List<AddAdvertiseState> _stack = [];
    return BlocProvider.value(value: _bloc,
    child: BlocBuilder<AddAdvertiseBloc, dynamic>(
        cubit: _bloc,
        builder: (context,state){
          if(state is InitialAddAdvertiseState){
            return SelectCategory();
          }else if(state is MasterBuyState){
            return BuyController();
          }else return Container();
        }),
    );
  }
}

