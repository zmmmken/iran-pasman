import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iranpasman/main.dart';

import '../showIntrrupt.dart';

class CheckConnectivity {

  void checkConnection()async {
    var connectivityResult =await (Connectivity().checkConnectivity());
    if(!(connectivityResult == ConnectivityResult.mobile || connectivityResult== ConnectivityResult.wifi) ){
      _connectionStatus(connectivityResult);
    }
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      _connectionStatus(result);

    });


  }

  void _connectionStatus(ConnectivityResult result){
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {

        if(Get.isSnackbarOpen){

          Get.back();

        }

      //we have connected to internet
    } else {
      //connections error
      if(!Get.isSnackbarOpen){
        getIt<ShowInterrupt>().showSnackBar(
            "توجه!!",
            "از ارتباط  با اینترنت اطمینان حاصل کنید.  ",
            Icons.wifi_off,
            new Duration(hours: 1));

      }

      print("result");
    }


  }
}
