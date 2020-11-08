import 'package:flutter/material.dart';
import 'package:iranpasman/home_page/homePage.dart';

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
      home: HomePage(),
      builder: (context, widget) {
        return Directionality(textDirection: TextDirection.rtl, child: widget);
      },
    );
  }
}
