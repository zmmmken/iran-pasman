import 'package:flutter/material.dart';
import 'package:iranpasman/Advertise/screen/advertise_screen.dart';
import 'package:iranpasman/fake_data.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/widgets/advertise_item.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: FakeData().advertise.length,
        itemBuilder: (context,index){
      return AdvertiseItem(FakeData().advertise[index]);
    });
  }




}
