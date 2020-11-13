import 'package:flutter/material.dart';

class BuyClipper extends CustomClipper<Path> {
  double constant = 15;
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo(size.width , 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, constant);
    path.lineTo(constant, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  } }
