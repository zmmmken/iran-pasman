import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/add_advertise/add_advertise_screen.dart';
import 'package:iranpasman/home/tabs/home/screen/homeTab.dart';
import 'package:iranpasman/notif/screen/notification_screen.dart';
import 'package:iranpasman/profile/bloc/profile_bloc.dart';
import 'package:iranpasman/profile/bloc/profile_state.dart';
import 'package:iranpasman/profile/profile_screen.dart';
import 'package:iranpasman/search/widget/page/search_screen.dart';
import 'package:iranpasman/widgets/backdrop_appbar.dart';
import 'package:iranpasman/widgets/custom_scaffold.dart';

class BasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BasePageSatte();
  }
}

class BasePageSatte extends State<BasePage> {
  double _headerHeight = 195;
  int _currentIndex = 0;
  String minPrice = "0";
  String maxPrice = "1000000";
  bool allCity = true;
  DateTime backButtonPressTime;
  GlobalKey<ScaffoldState> key = GlobalKey();
  RangeValues ranges = RangeValues(1, 1000000);

  Duration snackBarDuration = Duration(milliseconds: 2500);

  Widget bottomNavigationBar(context) {
    return new BottomNavigationBar(
      items: bottomNavigationItem(context),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedFontSize: 0.0,
      selectedFontSize: 0.0,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: TextStyle(fontSize: 0),
      selectedLabelStyle: TextStyle(fontSize: 0),
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  List<BottomNavigationBarItem> bottomNavigationItem(BuildContext context) {
    return <BottomNavigationBarItem>[
      new BottomNavigationBarItem(icon: new Icon(Icons.home), label: "home"),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.search), label: "search"),
      new BottomNavigationBarItem(
          icon: AnimatedContainer(
            height:45,
            width: 45,
            child: new Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            duration: Duration(milliseconds: 350),
            curve: Curves.linear,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(_currentIndex == 2 ?10 :25)),
                gradient: new LinearGradient(
                  colors: [
                    _currentIndex == 2 ?Colors.orangeAccent : Colors.orangeAccent,
                    _currentIndex == 2 ?Colors.orange.withBlue(380) : Colors.orange.withBlue(380),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                  stops: [0.4, 0.99],
                )),
          ),
          label: "add"),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.notifications), label: "notifications"),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.person), label: "profile"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () => handleWillPop(context),
      child: BackdropScaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "نمایش آگهی های همه شهر ها",
                      style: TextStyle(color: Colors.white),
                    ),
                    FittedBox(
                      child: CupertinoSwitch(
                          activeColor: Colors.orangeAccent,
                          trackColor: Colors.grey,
                          value: allCity,
                          onChanged: (res) {
                            setState(() {
                              allCity = !allCity;
//                        _bloc.filter[widget.text] = res;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:
                    Text("فیلتر هزینه", style: TextStyle(color: Colors.white)),
              ),
              RangeSlider(
                  activeColor: Colors.orangeAccent,
                  inactiveColor: Colors.orangeAccent.withOpacity(.4),
                  min: 1,
                  max: 1000000,
                  values: ranges,
                  onChanged: (value) {
                    print("START: ${value.start}, End: ${value.end}");
                    setState(() {
                      ranges = value;
                      minPrice = ranges.start.toString();
                      maxPrice = ranges.end.toString();
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DigitToWord.toWord(
                          double.parse(minPrice).floor().toString(),
                          StrType.NumWord,
                          isMoney: true),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      DigitToWord.toWord(
                          double.parse(maxPrice).floor().toString(),
                          StrType.NumWord,
                          isMoney: true),
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        frontLayer: Scaffold(key: key, body: tabWidget[_currentIndex]),
        bottomNavigationBar: bottomNavigationBar(context),
      ),
    );
  }

  Future<bool> handleWillPop(BuildContext context) async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            now.difference(backButtonPressTime) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      key.currentState.showSnackBar(SnackBar(
        content: Text(
          'برای خروج دوبار کلیک کنید',
          style: TextStyle(color: Colors.white, fontFamily: "MuliYekan"),
        ),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        duration: snackBarDuration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).primaryColor,
      ));
      return false;
    }

    return true;
  }

  SnackBar snackBar() => SnackBar(
        content: Text(
          'برای خروج دوبار کلیک کنید',
          style: TextStyle(color: Colors.white),
        ),
        padding: EdgeInsets.symmetric(vertical: 85, horizontal: 35),
        duration: snackBarDuration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).primaryColor,
      );
}

List<Widget> tabWidget = [
  HomeTab(),
  SearchScreen(),
  AddAdvertiseScreen(),
  NotificationScreen(),
  BlocProvider(
      create: (context) => ProfileBloc(InitialProfileState()),
      child: ProfileScreen())
];
