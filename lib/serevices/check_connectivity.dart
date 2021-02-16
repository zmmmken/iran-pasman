import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckConnectivity  {
  static ConnectivityResult prevStateWifi;

  void checkConnection() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {

      // Got a new connectivity status!
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi ){
        Get.back();
        //we have connected to internet
      }else{
        //connections error
        Get.snackbar("توجه!!", "از ارتباط  با اینترنت اطمینان حاصل کنید.  ",
          backgroundColor:Get.theme.buttonColor,
          icon:new Icon(Icons.wifi_off),
          duration:new Duration(hours: 1),

        );
        print(result);
      }


    });

  }



}