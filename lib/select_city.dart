import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/models/city.dart';
import 'package:iranpasman/network.dart';

import 'Base_page/basePage.dart';

class SelectCity extends StatefulWidget {
  int stateId;

  SelectCity(this.stateId);

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  bool showLoading = true;
  NetworkProvider provider;
  List<City> states;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = RepositoryProvider.of<NetworkProvider>(context);
    getAllState();
  }

  Future getAllState() async {
    states = await provider.getCityByStateId(widget.stateId);
    showLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("انتخاب شهر"),
      ),
      body: showLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: states.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BasePage()));
              },
              title: Text(states[index].title),
            );
          }),
    );
  }
}
