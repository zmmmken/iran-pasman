import 'package:iranpasman/master_bloc/bloc.dart';
import 'package:iranpasman/models/category.dart';
import 'package:meta/meta.dart';

class CategoryState extends MasterState{}
class ShowCategory extends MasterState{
  List<Category> categories;

  ShowCategory(this.categories);

}

class InitialCategoryState extends CategoryState {}
