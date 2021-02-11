import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/master_bloc/master_state.dart';
import 'package:iranpasman/profile/bloc/bloc.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileState {}

class InitialProfileState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileBloc _bloc = BlocProvider.of<ProfileBloc>(context);
    _bloc.add(CheckUserIsLogin());
    return Container();
  }
}

class ShowProfileLoading extends InitialProfileState{
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);
  }
}

class ShowLoginBtn extends InitialProfileState{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("شما هنوز وارد نشده ایید برای دسترسی به این بخش ابتدا باید وارد اکانت خود بشوید"),
        Ink(
          height: 45,
          width: 125,
          child: Center(child: Text("ورود"),),
        )
      ],
    );
  }
}

class ShowProfileFeatures extends InitialProfileState{
  @override
  Widget build(BuildContext context) {
    ProfileBloc _bloc = BlocProvider.of<ProfileBloc>(context);
    return ListView(
      children: [
        SizedBox(height: 55,),
        myTile(title: "پروفایل",iconData: Icons.person,route: Container(),context: context),
        myTile(title: "آگهی های من",iconData: Icons.assignment,route: Container(),context: context),
        myTile(title: "آگهی های نشان شده",iconData: Icons.save,route: Container(),context: context),
      ],
    );
  }

  Widget myTile({String title,IconData iconData,Widget route,context}){
    return ListTile(
      onTap: (){

      },
      leading: Icon(iconData, color: Colors.green,),
      title: Text(title),
    );
  }
}

