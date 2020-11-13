import 'package:flutter/material.dart';

class BuyButton extends StatefulWidget {
  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {

  bool isFullScreen = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  InkWell(
      onTap: (){
        setState(() {
          isFullScreen = !isFullScreen;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 190),
        onEnd: (){},
        width: isFullScreen ? size.width:145,
        height: isFullScreen?size.height:55,
        color: Colors.green,
        child: Center(
          child: AnimatedOpacity(
            opacity: isFullScreen ? 0 :1,
              duration: Duration(milliseconds: 60),
              child: Text("خرید اشتراک",style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}
