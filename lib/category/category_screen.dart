import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/category/bloc/bloc.dart';
import 'package:iranpasman/home/home_repository.dart';

import 'category_item.dart';

class CategoryScreen extends StatelessWidget {

  bool justSelectOne = false;


  CategoryScreen({this.justSelectOne=false});

  @override
  Widget build(BuildContext context) {
    CategoryBloc _bloc = BlocProvider.of<CategoryBloc>(context);
    _bloc.add(GetCategoryList(context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("دسته بندی ها"),
        centerTitle: true,
      ),
      body: BlocBuilder(
        cubit: _bloc,
        builder: (context,state){
          if(state is ShowCategory){
            return ListView.builder(
                itemCount: state.categories.length + 1,
                itemBuilder: (context,index){
                  if(index == state.categories.length){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 25),
                      child: justSelectOne ? Container():InkWell(
                        onTap: (){
                            _bloc.add(SubmitCategoryForm(context));
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: Ink(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Center(child: Text("ثبت",style: TextStyle(color: Theme.of(context).primaryColor),)),
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            color: Colors.orangeAccent
                          ),
                        ),
                      ),
                    );
                  }
                  return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Container(
                        width: 5,
                        height: 25,
                        decoration: ShapeDecoration(
                            color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )

                        ),

                      ),
                    ),
                    Expanded(child: CategoryItem(state.categories[index],justSelectOne)),
                  ],
                );
                }

                );
          }else return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
