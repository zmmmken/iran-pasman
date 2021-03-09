import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/add_advertise/screen/category/model/drop_down_model.dart';
import 'package:iranpasman/category/bloc/category_bloc.dart';
import 'package:iranpasman/category/bloc/category_state.dart';
import 'package:iranpasman/category/category_screen.dart';
import 'package:iranpasman/master_bloc/master_state.dart';
import 'package:iranpasman/models/ad_types.dart';
import 'package:iranpasman/models/category.dart';
import 'package:iranpasman/models/value_unit.dart';
import 'package:iranpasman/network.dart';
import './bloc.dart';

class MyBuyBloc extends Bloc<MyBuyEvent, MasterState> {
  MyBuyBloc(MasterState initialState, this.adType, this.appBarTitle)
      : super(initialState);

  final AdTypes adType;
  final String appBarTitle;

  List<File> images = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  ValueUnit selectedWeightUnit;
  ValueUnit selectedPriceUnit;

  List<ValueUnit> weightUnits;
  List<ValueUnit> priceUnits;

  Category selectedCategory;

  @override
  Stream<MasterState> mapEventToState(
    MyBuyEvent event,
  ) async* {
    if (event is InitialBuyEvent) {
      yield ShowLoading();
      NetworkProvider provider =
          RepositoryProvider.of<NetworkProvider>(event.context);
      weightUnits = await provider.getValueUnit();
      priceUnits = await provider.getPriceUnit();
      selectedWeightUnit = weightUnits[0];
      selectedPriceUnit = priceUnits[0];

      yield ShowData();
    }

    if (event is NavigateNextPage) {
      Navigator.of(event.context)
          .push(MaterialPageRoute(builder: (context) => event.next));
    }

    if (event is SelectCategoryEvent) {
      var res = await Navigator.of(event.context).push(MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => CategoryBloc(InitialCategoryState()),
              child: CategoryScreen(
                justSelectOne: true,
              ))));

      if (res != null) {
        selectedCategory = res;
      }
      yield ShowData();
    }

    if (event is AddToAdvertise) {
      NetworkProvider network =
          RepositoryProvider.of<NetworkProvider>(event.context);
      network.addAdvertise(this);
    }
  }
}
