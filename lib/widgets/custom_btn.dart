import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final onTap;
  final Widget text;

  final double radius;


  CustomButton({@required this.onTap,@required this.text,this.radius=15});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(radius)),

        ),
        height: 40,
        child: Material(
          color: Colors.green.withOpacity(.8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          child: Ink(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(radius)),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              splashColor: Colors.green,
              highlightColor: Colors.transparent,
              onTap:  onTap,
              child: Center(
                  child: text),
            ),
          ),
        ),
      ),
    );
  }
}
