import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///E:/New%20folder/cloth-rent/lib/brand-discription/widget/foldButton.dart';
import 'file:///E:/New%20folder/cloth-rent/lib/brand-discription/widget/typewriterTween.dart';
import 'package:iranpasman/buy-passmand-screen/widegt/buttonClipper.dart';
import 'package:iranpasman/buy-passmand-screen/widegt/headClipper.dart';

//Color screenBackground=Colors.grey.shade300;
Color screenBackground = new Color(0xFFf7f7f7);
TextStyle saleTitleStyle = new TextStyle(
    fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 22);
Color buySubscriptionButtonColor = Colors.redAccent;
TextStyle buySubscriptionButtonTextStyle =
    new TextStyle(color: Colors.greenAccent, fontSize: 16);

class BuyPassmand extends StatefulWidget {
  String imageAddress = "assets/images/trash.jpg";
  Color imageBackground = Colors.red;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BuyPassmandState();
  }
}

class BuyPassmandState extends State<BuyPassmand> {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;
  AnimationController controller;
  Animation<String> animation;
  static const String message =
      'شرکت MADAlI از سال 1990 شروع به فعالیت در حوزه فروش و اجاره لباس شروع به فعالیت کرده و این قول را به همه میدهد با هوشمند شدن فرایند اجاره و خرید لباس خدمتی بزرگ به شما بکند. '
      'شرکت MADAlI از سال 1990 شروع به فعالیت در حوزه فروش و اجاره لباس شروع به فعالیت کرده و این قول را به همه میدهد با هوشمند شدن فرایند اجاره و خرید لباس خدمتی بزرگ به شما بکند. '
      'شرکت MADAlI از سال 1990 شروع به فعالیت در حوزه فروش و اجاره لباس شروع به فعالیت کرده و این قول را به همه میدهد با هوشمند شدن فرایند اجاره و خرید لباس خدمتی بزرگ به شما بکند. '
      'شرکت MADAlI از سال 1990 شروع به فعالیت در حوزه فروش و اجاره لباس شروع به فعالیت کرده و این قول را به همه میدهد با هوشمند شدن فرایند اجاره و خرید لباس خدمتی بزرگ به شما بکند. ';

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackground,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              buildSliverHead(),
              SliverToBoxAdapter(child: buildDetail()),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          buySubscriptionButton(5000),
        ],
      ),
    );
  }

  Widget buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(expandedHeight, roundedContainerHeight,
          widget.imageAddress, widget.imageBackground),
    );
  }

  Widget buildDetail() {
    return Container(
      color: screenBackground,
      margin: EdgeInsets.only(
        right: 30,
        left: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          saleTitle("خرید همه نوغ ضایغات و لوازم منزل"),
          new SizedBox(
            height: 30,
          ),
          saleDetail(),
//          BuysubscriptionButton()
        ],
      ),
    );
  }

  saleTitle(String s) {
    return new Container(
      width: double.infinity,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new Text(
            s,
            style: saleTitleStyle,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  saleDetail() {
    return new Container(
      width: double.infinity,
      height: 250,
      decoration: new BoxDecoration(color: Colors.white, boxShadow: [
        new BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          offset: new Offset(0.0, 5),
          blurRadius: 10,
        )
      ]),
    );
  }

  buySubscriptionButton(double cost) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: new Align(
        alignment: Alignment.bottomRight,
        child: ClipPath(
          clipper: buttonClipper(),
          child: new Container(
            height: 65,
            width: 250,
            decoration: new BoxDecoration(
                color: buySubscriptionButtonColor,
              ),
            padding: EdgeInsets.only(right: 20, left: 20),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  "خرید اشتراک",
                  style: buySubscriptionButtonTextStyle,
                ),
                new RichText(
                  text: new TextSpan(children: [
                    new TextSpan(
                      text: "$cost",
                      style: buySubscriptionButtonTextStyle,
                    ),
                    new TextSpan(
                      text: "تومان",
                      style: buySubscriptionButtonTextStyle,
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  String imageAddress;
  Color imageBackground;

  DetailSliverDelegate(this.expandedHeight, this.roundedContainerHeight,
      this.imageAddress, this.imageBackground);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Hero(
        tag: "MADALI",
        child: Container(
//          color:imageBackground,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight - shrinkOffset,
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: AssetImage(
              imageAddress,
            ),
            fit: BoxFit.fill,
          )),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: expandedHeight - roundedContainerHeight - shrinkOffset,
                left: 0,
                child: ClipPath(
                  clipper: HeadClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: roundedContainerHeight,
                    decoration: BoxDecoration(
                      color: screenBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
