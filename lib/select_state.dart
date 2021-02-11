import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/models/city.dart';
import 'package:iranpasman/network.dart';
import 'package:iranpasman/select_city.dart';

class SelectState extends StatefulWidget {
  @override
  _SelectStateState createState() => _SelectStateState();
}

class _SelectStateState extends State<SelectState> {
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
    states = await provider.getAllState();
    showLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("انتخاب استان"),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCity(states[index].id)));
              },
              title: Text(states[index].title),
            );
      }),
    );
  }
}
