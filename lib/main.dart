import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/home_page/homePage.dart';
import 'package:iranpasman/screen/advertise_screen.dart';

import 'bloc/main_bloc/bloc.dart';
import 'bloc/main_bloc/main_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(),
        fontFamily: "MuliYekan",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context){
          return MultiBlocProvider(
            providers: [
              BlocProvider<MainBloc>(
                create: (context) {
                  return MainBloc(HomeState());
                },
              ),
            ],
            child: HomePage(),
          );
         },
        "/advertiseScreen": (context)=>AdvertiseScreen()
      },

      builder: (context, widget) {
        return Directionality(textDirection: TextDirection.rtl, child: widget);
      },
    );
  }
}
