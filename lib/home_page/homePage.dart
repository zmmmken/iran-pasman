import 'package:flutter/material.dart';
import 'package:iranpasman/widgets/backdrop_appbar.dart';
import 'package:iranpasman/widgets/bottom_navigation.dart';
import 'package:iranpasman/widgets/clipper.dart';
import 'package:iranpasman/widgets/custom_btn.dart';
import 'package:iranpasman/widgets/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  double _headerHeight = 195;

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        headerHeight: _headerHeight,
        backLayerBackgroundColor: Color.fromRGBO(17, 39, 50, 1),
        backgroundColor: Color.fromRGBO(17, 39, 50, 1),
        appBar: BackdropAppBar(
          backgroundColor: Color.fromRGBO(17, 39, 50, 1),
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
        frontLayer: Container(),
        bottomNavigationBar: CustomButtonNavigationBar());
  }
}

class SixEdgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height/3);
    path.lineTo(0, 2*size.height/3);
    path.lineTo(size.width/3, size.height);
    path.lineTo(2*size.width/3, size.height);
    path.lineTo(size.width, 2*size.height/3);
    path.lineTo(size.width, size.height/3);
    path.lineTo(2*size.width/3,0);
    path.lineTo(1*size.width/3,0);

    return path..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
