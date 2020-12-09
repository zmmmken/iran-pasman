import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondBuyScreen extends StatefulWidget {
  @override
  _SecondBuyScreenState createState() => _SecondBuyScreenState();
}

class _SecondBuyScreenState extends State<SecondBuyScreen> {
  List<File> myFiles = [
    File(""),
    File(""),
    File(""),
    File(""),
    File(""),
    File(""),
  ];
  var res =File;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("آگهی خرید",style: TextStyle(fontSize: 19),),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customPicker(0),
                  customPicker(1),
                  customPicker(2),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customPicker(3),
                  customPicker(4),
                  customPicker(5),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
  Widget customPicker(int index){
    return GestureDetector(
      onTap: ()async{
        PickedFile res = await ImagePicker().getImage(source: ImageSource.gallery);
        setState(() {
          myFiles[index] =new File(res.path);
        });
        print("test");
      },
      child: Container(
        height: 95,
        width: 95,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              side: BorderSide(color: Colors.green)
          ),
        ),
        child: myFiles[index].path== "" ? Center(
          child: Icon(Icons.camera_alt,color: Colors.green,),
        ) : Image.file(myFiles[index],fit: BoxFit.cover,),
      ),
    );
  }

}
