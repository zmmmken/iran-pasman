import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/bloc/bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/second_screen.dart';
import 'package:iranpasman/add_advertise/screen/category/model/drop_down_model.dart';
import 'package:iranpasman/master_bloc/master_state.dart';
import 'package:iranpasman/models/value_unit.dart';
import 'package:iranpasman/widgets/base_widget.dart';

class FirstBuyScreen extends StatefulWidget {
  @override
  _FirstBuyScreenState createState() => _FirstBuyScreenState();
}

class _FirstBuyScreenState extends State<FirstBuyScreen> {
  MyBuyBloc _bloc;
  DropDownModel weightModel;
  DropDownModel selectedPrice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocProvider.of<MyBuyBloc>(context);
    _bloc.add(InitialBuyEvent(context));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BaseWidget(
      title: _bloc.appBarTitle,
      body: BlocBuilder(
        cubit: _bloc,
        builder: (context, state) {
          if (state is ShowLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShowData) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.arrow_forward_ios,),
                onPressed: () {
                  _bloc.images = [];
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BlocProvider.value(
                      value: _bloc,
                      child: SecondBuyScreen(),
                    );
                  }));
                },
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "عنوان آگهی"),
                        controller: _bloc.titleController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "توضیحات آگهی"),
                        controller: _bloc.descriptionController,
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * .4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: "مقدار"),
                              keyboardType: TextInputType.number,
                              controller: _bloc.amountController,
                            ),
                          ),
                          Container(
                            width: size.width * .4,
                            child: DropdownButton<ValueUnit>(
                              isExpanded: true,
                              underline: Container(),
                              value: _bloc.selectedWeightUnit,
                              onChanged: (ValueUnit newValue) {
                                setState(() {
                                  _bloc.selectedWeightUnit = newValue;
                                });
                              },
                              items: _bloc.weightUnits
                                  .map<DropdownMenuItem<ValueUnit>>(
                                      (ValueUnit value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child:
                                      Container(child: Text(value.title ?? "")),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * .4,
                            child: TextFormField(
                              controller: _bloc.priceController,
                              decoration: InputDecoration(labelText: "قیمت"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: size.width * .4,
                            child: DropdownButton<ValueUnit>(
                              isExpanded: true,
                              underline: Container(),
                              value: _bloc.selectedPriceUnit,
                              onChanged: (ValueUnit newValue) {
                                setState(() {
                                  _bloc.selectedPriceUnit = newValue;
                                });
                              },
                              items: _bloc.priceUnits
                                  .map<DropdownMenuItem<ValueUnit>>(
                                      (ValueUnit value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child:
                                      Container(child: Text(value.title ?? "")),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}
