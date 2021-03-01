import 'package:flutter/material.dart';
import 'package:iranpasman/widgets/clipper.dart';

class BaseWidget extends StatelessWidget {
  final String title;
  final Widget body;


  BaseWidget({@required this.title,@required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ClipPath(
        clipper: CustomClip(),
        child: Scaffold(
          body: body,
        ),
      ),
    );
  }
}
