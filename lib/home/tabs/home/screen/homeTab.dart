import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iranpasman/category/bloc/bloc.dart';
import 'package:iranpasman/category/category_screen.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/home/tabs/home/widget/buyAdd-widget/buyAddTab.dart';
import 'package:iranpasman/home/tabs/home/widget/dailyPrice-widget/dailyPrice.dart';
import 'package:iranpasman/models/ad_types.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeTabState();
  }
}

class HomeTabState extends State<HomeTab> {
  double headIconHeight = 60;

  int currentTab = 0;
  Color selectedTabColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    HomeRepository repository = RepositoryProvider.of<HomeRepository>(context);

    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.storage),
        backgroundColor: Theme.of(context).primaryColor,
        label: Text("دسته بندی"),
        isExtended: true,
        onPressed: ()async{
          var res = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider(
              create: (context)=>CategoryBloc(InitialCategoryState()),
              child: CategoryScreen())));
          if(res != null && res==true){
            repository.buyAds = [];
            repository.sellAds = [];
            repository.ads[AdTypes.BUY] = [];
            repository.ads[AdTypes.SELL] = [];
            print("clean");

          }
          setState(() {
            currentTab = 0;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: new Column(
          children: [
            Container(
                color: Colors.white,
                child: _tabBar()),
            new SizedBox(height: 10),
            Expanded(
              child: Container(
                  child: tabsContent[currentTab]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        tabBarItem("assets/images/bid.svg", onTap: () {
          setState(() {
            currentTab = 3;
          });
        }, color: _getTabColor(3), text: "مزایده"),
        tabBarItem("assets/images/shopping-bag.svg", onTap: () {
          setState(() {
            currentTab = 2;
          });
        }, color: _getTabColor(2), text: "آگهی فروش"),
        tabBarItem("assets/images/buy.svg", onTap: () {
          setState(() {
            currentTab = 1;
          });
        }, color: _getTabColor(1), text: "آگهی خرید"),
        tabBarItem("assets/images/money.svg", onTap: () {
          setState(() {
            currentTab = 0;
          });
        }, color: _getTabColor(0), text: "قیمت روز"),
      ],
    );
  }

  Widget tabBarItem(String imageAddress,
      {Function onTap, String text: "", Color color}) {
    return GestureDetector(
      onTap: onTap,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new SvgPicture.asset(
            imageAddress,
            height: headIconHeight,
            color: color,
          ),
          new SizedBox(
            height: 5,
          ),
          new Text(
            text,
            style: new TextStyle(
              color: color,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Color _getTabColor(int index) {
    if (currentTab == index) {
      return selectedTabColor;
    } else {
      return Colors.black54;
    }
  }
}

List<Widget> tabsContent = [
  new DailyPrice(),
  new BuyTab(AdTypes.BUY),
//  new Center(child: new Text("اگهی خرید"),),
  new BuyTab(AdTypes.SELL),
  new Center(
    child: new Text("مزایده"),
  ),
];
