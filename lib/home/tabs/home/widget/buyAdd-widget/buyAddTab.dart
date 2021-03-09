import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/Advertise/screen/advertise_screen.dart';
import 'package:iranpasman/fake_data.dart';
import 'package:iranpasman/home/bloc/home_bloc.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/master_bloc/bloc.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/models/ad_types.dart';
import 'package:iranpasman/network.dart';
import 'package:iranpasman/widgets/advertise_item.dart';

class BuyTab extends StatefulWidget {
  AdTypes type;

  BuyTab(this.type);

  @override
  _BuyTabState createState() => _BuyTabState();
}

class _BuyTabState extends State<BuyTab> {
  HomeBloc _bloc;

  @override
  void didUpdateWidget(BuyTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.type != oldWidget.type) {
      _bloc.add(ChangeHomeTab(adType: widget.type));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder(builder: (context, state) {
      if (state is ShowHomeData) {
        return DataList(context, state.ads);
      } else if (state is ShowLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else
        return Container();
    });
  }

  Widget DataList(context, List<Ad> ads) {
    return Column(
      children: [
        new Container(
          height: 10,
          width: double.infinity,
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Colors.transparent, Colors.grey.withOpacity(0.2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 0.99])),
        ),
        new SizedBox(
          height: 4,
        ),
        itemList(context, ads),
      ],
    );
  }

  Widget itemList(BuildContext context, List<Ad> temp) {
    return new Expanded(
      child: new Container(
        width: double.infinity,
        child: new ListView.builder(
          itemCount: temp.length,
          itemBuilder: (context, index) {
            if (index == 10) {}
            return AdvertiseItem(temp[index]);
          },
        ),
      ),
    );
  }
}
