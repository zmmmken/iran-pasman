import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/search/bloc/bloc.dart';
import 'package:iranpasman/search/widget/widget/search_filter_widget.dart';

class SearchFilter extends StatelessWidget {
  SearchBloc _bloc ;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<SearchBloc>(context);
    bool isFirst = true;
    List<Widget> filters=[] ;
    _bloc.filter.forEach((str,res){
      if(!isFirst)
        filters.add(Divider());
      filters.add(SearchFilterWidget(text: str,));
      isFirst = false;
    });


    return Container(
      color: Colors.white,
      child: Column(
        children: filters,
      ),
    );

  }



}
