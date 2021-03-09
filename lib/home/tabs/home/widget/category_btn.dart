import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/category/bloc/bloc.dart';
import 'package:iranpasman/category/bloc/category_bloc.dart';
import 'package:iranpasman/category/category_screen.dart';

class CategoryBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.storage),
      backgroundColor: Theme.of(context).primaryColor,
      label: Text("دسته بندی"),
      isExtended: true,
      onPressed: () async {
        var res = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => CategoryBloc(InitialCategoryState()),
                child: CategoryScreen())));
        if (res != null && res == true) {
          //todo clean repository when back from categoryScreen
          //todo get new Ata for new SelectedCategory
        }
      },
    );
  }
}
