import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyPrice extends StatelessWidget {
  Color _oodListColor = Colors.white.withOpacity(0.5);
  Color _evenListColor = Colors.grey.withOpacity(0.4);

  double itemOfListHeight = 48;
  final TextStyle _headOfListTextStyle = new TextStyle(color: Colors.white);
  final TextStyle _itemOfListTextStyle = new TextStyle(
    color: Colors.black54,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(children: [
      new Container(
        width: double.infinity,
        height: itemOfListHeight,
        color: Theme.of(context).primaryColor,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            itemSizeController(
              new Text(
                "نوع",
                style: _headOfListTextStyle,
              ),
              context
            ),
            itemSizeController(
              new Text("خرده بار", style: _headOfListTextStyle),
              context
            ),
            itemSizeController(
              new Text("عمده بار", style: _headOfListTextStyle),
              context
            ),
            itemSizeController(
              new Text("جزئیات", style: _headOfListTextStyle),
              context
            ),
          ],
        ),
      ),
      _itemList(),
    ]);
  }

  Widget _itemList() {
    return Expanded(
      child: new Container(
        width: double.infinity,
//      height: 200,
//      color: Colors.blue,
        child: new ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return _cart(index, context);
          },
        ),
      ),
    );
  }

  Widget _cart(int index, context) {
    return Container(
      width: double.infinity,
//        height: itemOfListHeight,
      color: index % 2 == 0 ? _oodListColor : _evenListColor,

      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          itemSizeController(
            new Text(
              "فله روغنی",
              style: _itemOfListTextStyle,
            ),
            context
          ),
          itemSizeController(
            new Text("7755", style: _itemOfListTextStyle),
            context
          ),
          itemSizeController(
            new Text("5268", style: _itemOfListTextStyle),
            context
          ),
          itemSizeController(
            IconButton(
              icon: RotatedBox(
                  quarterTurns: 2,
                  child: new Icon(
                    Icons.arrow_back_ios,
                  )),
              color: Colors.brown.withOpacity(.6),
              iconSize: 20,
              onPressed: () {
                print(index);
              },
              splashRadius: 20,
              splashColor: Colors.red,
            ),
              context
          ),

        ],
      ),
    );
  }

  Widget itemSizeController(Widget widget,context) {
    return new Container(
      width: MediaQuery.of(context).size.width*.25,
      child: Center(child: widget),
    );
  }
}
