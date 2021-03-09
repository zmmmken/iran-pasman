import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iranpasman/category/bloc/bloc.dart';
import 'package:iranpasman/category/category_screen.dart';
import 'package:iranpasman/home/bloc/home_bloc.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/home/tabs/home/widget/buyAdd-widget/buyAddTab.dart';
import 'package:iranpasman/home/tabs/home/widget/category_btn.dart';
import 'package:iranpasman/home/tabs/home/widget/dailyPrice-widget/dailyPrice.dart';
import 'package:iranpasman/home/tabs/home/widget/tab_bar.dart';
import 'package:iranpasman/models/ad_types.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeTabState();
  }
}

class HomeTabState extends State<HomeTab> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: CategoryBtn(),
      body: BlocBuilder(
        cubit: HomeBloc(),
        builder:(context,state)=> Padding(
          padding: const EdgeInsets.only(top: 15),
          child: new Column(
            children: [
              Container(color: Colors.white, child: HomeTabBar()),
              SizedBox(height: 10),
              Expanded(
                child: Container(child: tabsContent[currentTab]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> tabsContent = [
  new DailyPrice(),
  new BuyTab(AdTypes.BUY),
  new BuyTab(AdTypes.SELL),
  new Center(
    child: new Text("مزایده"),
  ),
];
