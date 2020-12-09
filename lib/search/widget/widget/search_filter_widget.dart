import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/search/bloc/bloc.dart';

class SearchFilterWidget extends StatefulWidget {

  String text;


  SearchFilterWidget({ this.text});

  @override
  _SearchFilterWidgetState createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  SearchBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocProvider.of<SearchBloc>(context);
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:14.0,vertical: 3),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.text),
            FittedBox(
              child: CupertinoSwitch(
                  activeColor: Colors.green,
                  value: _bloc.filter[widget.text], onChanged: (res){
                setState(() {
                  _bloc.filter[widget.text] = res;
                });
              }),
            )
          ],
        ),
      ),
    );
  }
}
