import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/master_bloc/master_state.dart';
import 'package:iranpasman/models/category.dart';
import './bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, MasterState> {
  CategoryBloc(CategoryState initialState) : super(initialState);

  @override
  Stream<MasterState> mapEventToState(
    CategoryEvent event,
  ) async* {
    // TODO: Add Logic
    if(event is GetCategoryList){
      yield ShowLoading();
      HomeRepository repository = RepositoryProvider.of<HomeRepository>(event.context);
      List<Category> res =await repository.getRootCategory();
      yield ShowCategory(res);
    }
    else if(event is SubmitCategoryForm){
      HomeRepository repository = RepositoryProvider.of<HomeRepository>(event.context);
      repository.selectedCategory = repository.tempSelectedCategory;
      Navigator.pop(event.context,true);
    }
  }
}
