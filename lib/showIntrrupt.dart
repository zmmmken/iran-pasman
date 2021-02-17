

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowInterrupt{

  void showSnackBar(String title,String message,IconData iconData,Duration duration){
    Get.snackbar(title,message,
      backgroundColor:Get.theme.buttonColor,
      icon:new Icon(iconData),
      duration:duration,

    );
  }

}