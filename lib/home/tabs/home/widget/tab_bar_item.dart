import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabBarItem extends StatelessWidget {

  double headIconHeight = 60;
  final String imageAddress;
  final Function onTap;
  final String text;
  final Color color;


  TabBarItem({this.imageAddress, this.onTap, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageAddress,
            height: headIconHeight,
            color: color,
          ),
          new SizedBox(
            height: 5,
          ),
          new Text(
            text,
            style: new TextStyle(
              color: color,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
