import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/bloc/main_bloc/bloc.dart';
import 'package:iranpasman/widgets/buy_clipper.dart';

import 'custom_btn.dart';

class CustomButtonNavigationBar extends StatelessWidget {
  MainBloc _bloc;
  Map<int, IconData> bottomIcon = {
    0: Icons.home,
    1: Icons.search,
    3: Icons.add_alert,
    4: Icons.person,
  };

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<MainBloc>(context);
    return BlocBuilder<MainBloc, MainState>(
      cubit: _bloc,
      builder: (context, _) => Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        color: Color.fromRGBO(17, 39, 50, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomIcon(0),
            BottomIcon(1),
            CustomButton(
              text: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 185,
                      child: Column(
                        children: [
                          ListTile(title: Text("آگهی خرید"),),
                          ListTile(title: Text("آگهی فروش"),),
                          ListTile(title: Text("آگهی مزایده"),),
                        ],
                      ),
                    ));
              },
              radius: 8,
            ),
            BottomIcon(3),
            BottomIcon(4),
          ],
        ),
      ),
    );
  }

  onTap(int state) {
    _bloc.add(ChangeState(state));
  }

  BottomIcon(int state) {
    bool isActive = _bloc.selectedState == state;
    return IconButton(
      icon: Icon(bottomIcon[state],
          color: isActive ? Colors.green : Colors.white),
      onPressed: () {
        onTap(state);
      },
    );
  }
}
