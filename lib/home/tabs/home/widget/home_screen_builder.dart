import 'package:flutter/material.dart';
import 'package:iranpasman/home/bloc/home_bloc.dart';
import 'package:iranpasman/master_bloc/bloc.dart';

class HomeScreenBuilder extends StatelessWidget {
  MasterState state;

  @override
  Widget build(BuildContext context) {
    return returnHomeState();
  }

  Widget returnHomeState(){
    if(state is ShowLoading){
      return CircularProgressIndicator();
    }else if(state is NoData){
      return Center(child: Text("موردی یافت نشد"),);
    }else if(state is ShowHomeData){

    }

    return Container();
  }

  Widget showData(){

  }


}
