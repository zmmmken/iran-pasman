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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      builder: (context, widget) {
        return Directionality(textDirection: TextDirection.rtl, child: widget);
      },
    );
  }
}
