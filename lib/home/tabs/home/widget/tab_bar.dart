import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/home/bloc/home_bloc.dart';
import 'package:iranpasman/home/tabs/home/widget/tab_bar_item.dart';
import 'package:iranpasman/models/ad_types.dart';

class HomeTabBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var _bloc = BlocProvider.of<HomeBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TabBarItem(
            imageAddress:"assets/images/bid.svg",
            onTap: () {
              _bloc.add(ChangeHomeTab(adType: AdTypes.AUCTION));
            },
            color: _getTabColor(AdTypes.AUCTION,_bloc),
            text: "مزایده"
        ),
        TabBarItem(
            imageAddress:"assets/images/shopping-bag.svg",
            onTap: () {
              _bloc.add(ChangeHomeTab(adType: AdTypes.SELL));
              },
            color: _getTabColor(AdTypes.DAILY_PRICE,_bloc),
            text: "آگهی فروش"
        ),
        TabBarItem(
            imageAddress:"assets/images/buy.svg",
            onTap: () {
              _bloc.add(ChangeHomeTab(adType: AdTypes.BUY));
            },
            color: _getTabColor(AdTypes.BUY,_bloc),
            text: "آگهی خرید"
        ),
        TabBarItem(
            imageAddress:"assets/images/money.svg",
            onTap: () {
              _bloc.add(ChangeHomeTab(adType: AdTypes.DAILY_PRICE));
            },
            color: _getTabColor(AdTypes.DAILY_PRICE,_bloc),
            text: "قیمت روز"
        ),
      ],
    );
  }


  Color _getTabColor(AdTypes type,HomeBloc bloc) {
    Color selectedTabColor = Colors.green;
    if (type == bloc.selectedType) {
      return selectedTabColor;
    } else {
      return Colors.black54;
    }
  }
}