import 'package:flutter/material.dart';
import 'package:iranpasman/Base_page/basePage.dart';
import 'package:iranpasman/network.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NetworkProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = NetworkProvider();
    getData();
  }

  getData()async{
    await provider.getAllCategory();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BasePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
