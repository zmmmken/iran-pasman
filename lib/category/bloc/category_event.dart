import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoryEvent {}

class GetCategoryList extends CategoryEvent{
  BuildContext context;

  GetCategoryList(this.context);

}

class SubmitCategoryForm extends CategoryEvent{
  BuildContext context;

  SubmitCategoryForm(this.context);

}
