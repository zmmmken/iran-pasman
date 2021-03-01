import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/bloc/bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/select_category.dart';
import 'package:iranpasman/widgets/base_widget.dart';

class SecondBuyScreen extends StatefulWidget {
  @override
  _SecondBuyScreenState createState() => _SecondBuyScreenState();
}

class _SecondBuyScreenState extends State<SecondBuyScreen> {

  MyBuyBloc _bloc;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocProvider.of<MyBuyBloc>(context);
  }



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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.done),
        onPressed: (){
          _bloc.add(AddToAdvertise(context));
        },
      ),
      body: BaseWidget(
        title: "آگهی خرید",
        body: BlocBuilder(
          cubit: _bloc,
          builder: (context,state){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("اظافه کردن عکس",style: TextStyle(fontSize: 19),),
                    ),
                    SizedBox(height: 5,),
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
                    ),
                    SizedBox(height: 15,),
                    ListTile(
                      title: Text("دسته بندی"),
                      trailing: _bloc.selectedCategory==null
                          ? Icon(Icons.arrow_forward_ios_rounded, size: 14,)
                          : Chip(label: Text(_bloc.selectedCategory.title,style: TextStyle(fontSize: 10),)),
                      onTap: (){
                        _bloc.add(SelectCategoryEvent(context));
                      },
                    )
                  ],
                ),
              ),
            );
          },
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
          _bloc.images.add(myFiles[index]);
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
