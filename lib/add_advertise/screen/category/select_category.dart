import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  int selectedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              "انتخاب نوع آگهی",
              style: TextStyle(fontSize: 18),
            ),
          ),
          item("assets/images/buy.svg", "خریدارم", Container(), 0),
          item("assets/images/shopping-bag.svg", "فروشنده ام", Container(), 1),
          item("assets/images/bid.svg", "مزایده", Container(), 2),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color.fromRGBO(17, 39, 50, 1),
        child: Center(child: Icon(Icons.arrow_forward_ios)),
        onPressed: (){

        },
      ),
    );
  }

  Widget item(String icon, String title, Widget route, int id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNumber = id;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 75,
              height: 75,
              color: selectedNumber == id ? Colors.green : Colors.black,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: selectedNumber == id ? Colors.green : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
