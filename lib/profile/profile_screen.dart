import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 55,),
          myTile(title: "پروفایل",iconData: Icons.person,route: Container(),context: context),
          myTile(title: "آگهی های من",iconData: Icons.assignment,route: Container(),context: context),
          myTile(title: "آگهی های نشان شده",iconData: Icons.save,route: Container(),context: context),
        ],
      ),
    );
  }

  Widget myTile({String title,IconData iconData,Widget route,context}){
    return ListTile(
      onTap: (){
//        Navigator.of(context).push(MaterialPageRoute(builder: (context){
//          return route;
//        }));
      },
      leading: Icon(iconData, color: Colors.green,),
      title: Text(title),
    );
  }
}
