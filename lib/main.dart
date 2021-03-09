import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:iranpasman/buy-passmand-screen/screen/buyScreen.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/local_storage.dart';
import 'package:iranpasman/network.dart';
import 'package:iranpasman/select_state.dart';
import 'package:iranpasman/serevices/check_connectivity.dart';
import 'package:iranpasman/serviceLocator.dart';
import 'package:iranpasman/widgets/splash_screen.dart';

import 'Base_page/basePage.dart';
import 'login/screen/enter_phone_number_screen.dart';
GetIt getIt = GetIt.instance;

void checkConnection(){
  getIt<CheckConnectivity>().checkConnection();

}


void main() {
  Storage storage = new Storage();
  setupLocator();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  Map _rout=<String,Widget Function(BuildContext context)>{
    "/BuyPassmand":(context)=>BuyPassmand(),
    '/splash' : (context)=>SplashScreen(),
    '/enter_phone_number' : (context)=>EnterPhoneNumberScreen(),
  };
  @override
  Widget build(BuildContext context) {
    // checkConnection();
    var myConnection=getIt<CheckConnectivity>().checkConnection();
   
    return MultiRepositoryProvider(
      providers: [
            RepositoryProvider(create: (context)=> HomeRepository()),
            RepositoryProvider(create: (context)=> NetworkProvider())
      ],
      child: GetMaterialApp(
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
//        home: SplashScreen(),
        home: EnterPhoneNumberScreen(),
//        home: SelectState(),
        builder: (context, widget) {
          return Directionality(textDirection: TextDirection.rtl, child: widget);
        },
      ),
    );
  }
}
