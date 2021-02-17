

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowInterrupt{

  void showSnackBar(String title,String message,IconData iconData,Duration duration){
    Get.snackbar("توجه!!", "از ارتباط  با اینترنت اطمینان حاصل کنید.  ",
      backgroundColor:Get.theme.buttonColor,
      icon:new Icon(Icons.wifi_off),
      duration:new Duration(hours: 1),

    );
  }

}