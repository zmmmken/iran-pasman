import 'package:flutter/material.dart';

class CustomClip extends CustomClipper<Path> {
  int constant = 30;
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(size.width - constant, 0);
    path.lineTo(size.width, constant.toDouble());
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  } }
