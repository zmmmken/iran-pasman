import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/Advertise/bloc/bloc.dart';

class InfoButton extends StatefulWidget {
  @override
  _InfoButtonState createState() => _InfoButtonState();
}

class _InfoButtonState extends State<InfoButton> {
  bool isFullScreen = false;
  bool showColumn = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        setState(() {
          isFullScreen = true;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 190),
        onEnd: () {
          setState(() {
            showColumn = !showColumn;
          });
        },
        width: isFullScreen ? size.width - 25 : 145,
        height: isFullScreen ? 190 : 55,
        color: isFullScreen ? Color.fromRGBO(17, 39, 50, .9) : Colors.green,
        child: isFullScreen
            ? AnimatedOpacity(
          opacity: !isFullScreen ? 0 : 1,
          duration: Duration(milliseconds: 55),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: showColumn ? Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            isFullScreen = false;
                          });
                        })
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                  title: Text(
                    "تماس با این آگهی",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Colors.green,
                  ),
                  title: Text(
                    "پیام به ای آگهی",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ) : Container(),
          ),
        )
            : Center(
          child: AnimatedOpacity(
              opacity: isFullScreen ? 0 : 1,
              duration: Duration(milliseconds: 60),
              child: Text(
                "تماس",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}