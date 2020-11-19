import 'package:flutter/material.dart';
class HeadClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path=Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height/2);
    path.lineTo(size.height/2,0);
    path.lineTo(size.width-size.height/2, 0);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}