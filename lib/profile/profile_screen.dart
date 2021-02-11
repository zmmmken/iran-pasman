import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/profile/bloc/bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        cubit: BlocProvider.of<ProfileBloc>(context),
        builder: (context,state)=>state,
      ),
    );
  }

}
