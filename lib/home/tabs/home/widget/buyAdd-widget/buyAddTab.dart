import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iranpasman/Advertise/screen/advertise_screen.dart';
import 'package:iranpasman/fake_data.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/widgets/advertise_item.dart';
class buyAddTab extends StatelessWidget{
  BorderSide itemCartLineSide=new BorderSide(color: Colors.grey.withOpacity(0.6),width: 1);
  TextStyle titleOfItemCartTextStyle=new TextStyle(fontWeight: FontWeight.bold,color: Colors.black);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        new Container(
          height: 10,
          width: double.infinity,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Colors.transparent,
                Colors.grey.withOpacity(0.2)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7,0.99]
            )
          ),
        ),
        new SizedBox(height: 4,),
        itemList(context),
      ],
    );
  }

 Widget itemList(BuildContext context) {
    return new Expanded(
      child: new Container(
        width: double.infinity,
        child:new ListView.builder(
          itemCount: FakeData().advertise.length,
          itemBuilder: (context,index){
            return AdvertiseItem(FakeData().advertise[index]);

          },
        ) ,
      ),
    );
 }
}