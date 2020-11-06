import 'package:flutter/material.dart';
import 'package:iranpasman/widgets/backdrop_appbar.dart';
import 'package:iranpasman/widgets/clipper.dart';
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
          text: TextSpan(
            children:<TextSpan>[
              TextSpan(text: ' ایران پس',
                  style: TextStyle(
                      color: Color.fromRGBO(3, 134, 65, 1), fontSize: 20,fontFamily: "MuliYekan"),
              ),
              TextSpan(text: 'مان',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20,fontFamily: "MuliYekan"),
              )
            ]
          ),
        ),
      ),
      frontLayerBorderRadius: BorderRadius.circular(8),
      backLayer: Container(
        height: _headerHeight*2,
        child: Column(
          children: [
            Container(
              height: 35,
              width: double.maxFinite,

            )
          ],
        ),


      ),
      frontLayer: Center(
        child: Container()
      ),
    );
  }
}
