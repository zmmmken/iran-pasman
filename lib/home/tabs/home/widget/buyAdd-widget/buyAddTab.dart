import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/Advertise/screen/advertise_screen.dart';
import 'package:iranpasman/fake_data.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/models/ad_types.dart';
import 'package:iranpasman/network.dart';
import 'package:iranpasman/widgets/advertise_item.dart';

class BuyTab extends StatefulWidget {
  @override
  _BuyTabState createState() => _BuyTabState();
}

class _BuyTabState extends State<BuyTab> {
  BorderSide itemCartLineSide=new BorderSide(color: Colors.grey.withOpacity(0.6),width: 1);
  TextStyle titleOfItemCartTextStyle=new TextStyle(fontWeight: FontWeight.bold,color: Colors.black);
  NetworkProvider network = NetworkProvider();
  HomeRepository prov;
  List<Ad> ads = [];
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prov = RepositoryProvider.of<HomeRepository>(context);
    getData(page);
  }

  getData(int page)async{

    await prov.getAds(AdTypes.BUY);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  prov.buyAds==null ?Center(child: CircularProgressIndicator()): Column(
      children: [
        new Container(
          height: 10,
          width: double.infinity,
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.grey.withOpacity(0.2)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7,0.99]
              )
          ),
        ),
        new SizedBox(height: 4,),
        itemList(context),
      ],
    );
  }

  Widget itemList(BuildContext context) {
    List<Ad> temp  = RepositoryProvider.of<HomeRepository>(context).buyAds;
    return new Expanded(
      child: new Container(
        width: double.infinity,
        child:new ListView.builder(
          itemCount: temp.length,
          itemBuilder: (context,index){
            if(index == 10){
              getData(page);
            }
            return AdvertiseItem(temp[index]);

          },
        ) ,
      ),
    );
  }
}
