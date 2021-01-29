import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/buy-passmand-screen/screen/buyScreen.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/widgets/splash_screen.dart';

import 'Base_page/basePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Map _rout=<String,Widget Function(BuildContext context)>{
    "/BuyPassmand":(context)=>BuyPassmand(),
    '/splash' : (context)=>SplashScreen()
  };
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context)=> HomeRepository(),
      child: MaterialApp(
        title: 'Iran Pasmand',
        routes:_rout ,
        theme: ThemeData(
          textTheme: TextTheme(),
          fontFamily: "MuliYekan",
          primarySwatch: Colors.blue,
          primaryColor:Color.fromRGBO(17, 39, 50, 1) ,
          appBarTheme: new AppBarTheme(color: Color.fromRGBO(17, 39, 50, 1)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor:new Color(0xFFf7f7f7),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(17, 39, 50, 1),
            elevation: 0.4,
            selectedItemColor: Colors.orangeAccent,
            unselectedItemColor: Colors.grey.withOpacity(0.4),
          )

        ),
        home: SplashScreen(),
        builder: (context, widget) {
          return Directionality(textDirection: TextDirection.rtl, child: widget);
        },
      ),
    );
  }
}
