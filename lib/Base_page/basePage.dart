import 'package:flutter/material.dart';
import 'package:iranpasman/tab/home/screen/homeTab.dart';

import 'package:iranpasman/widgets/backdrop_appbar.dart';
import 'package:iranpasman/widgets/clipper.dart';
import 'package:iranpasman/widgets/custom_scaffold.dart';
class BasePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return BasePageSatte();
  }

}
class BasePageSatte extends State<BasePage> {
  double _headerHeight = 195;
  int _currentIndex=0;



  Widget bottomNavigationBar(context) {
    return new BottomNavigationBar(
      items: bottomNavigationItem(context),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedFontSize: 0.0,
      selectedFontSize: 0.0,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: TextStyle(fontSize: 0),
      selectedLabelStyle:TextStyle(fontSize: 0) ,
      currentIndex:_currentIndex,
      onTap: (int index){
          setState(() {
            _currentIndex=index;
          });
      },

    );
  }

  List<BottomNavigationBarItem> bottomNavigationItem (BuildContext context){
    return  <BottomNavigationBarItem>[
      new BottomNavigationBarItem(icon: new Icon(Icons.home),label: "home"),
      new BottomNavigationBarItem(icon: new Icon(Icons.search), label: "search"),
      new BottomNavigationBarItem(
          icon: Container(
            height: 45,
            width: 45,
            child: new Icon(Icons.add,color: Colors.white,size: 40,),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: new LinearGradient(
                    colors: [
                      Colors.orangeAccent,
                      Colors.orange.withBlue(380),
                    ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                  stops: [
                    0.4,
                    0.99
                  ],
                )
            ),
          ),
          label: "add"),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.notifications), label: "notifications"),
      new BottomNavigationBarItem(icon: new Icon(Icons.person), label: "profile"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BackdropScaffold(
      headerHeight: _headerHeight,
      backLayerBackgroundColor: Color.fromRGBO(17, 39, 50, 1),
      backgroundColor: Color.fromRGBO(17, 39, 50, 1),
      appBar: BackdropAppBar(
//        backgroundColor: Color.fromRGBO(17, 39, 50, 1),
        title: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: ' ایران پس',
              style: TextStyle(
                  color: Color.fromRGBO(3, 134, 65, 1),
                  fontSize: 20,
                  fontFamily: "MuliYekan"),
            ),
            TextSpan(
              text: 'مان',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: "MuliYekan"),
            )
          ]),
        ),
      ),
      frontLayerBorderRadius: BorderRadius.circular(8),
      backLayer: Container(
        height: _headerHeight * 2,
        child: Column(
          children: [
            Container(
              height: 35,
              width: double.maxFinite,
            )
          ],
        ),
      ),
      frontLayer: tabWidget[0],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

}


List <Widget>tabWidget=[
  new HomeTab(),
  new Container(height: double.infinity,width: double.infinity,color: Colors.white,),
  new Container(height: double.infinity,width: double.infinity,color: Colors.red,),
  new Container(height: double.infinity,width: double.infinity,color: Colors.orange,),
  new Container(height: double.infinity,width: double.infinity,color: Colors.blue,),
];
