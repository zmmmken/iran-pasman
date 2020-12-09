import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/search/bloc/bloc.dart';
import 'package:iranpasman/search/widget/widget/search_filter.dart';
import 'package:iranpasman/widgets/advertise_item.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  int factor = 0;
  

  @override
  Widget build(BuildContext context) {
    final _bloc = SearchBloc(InitialSearchState());
    bool isInitial = true;
    _bloc.listen((state){
      if(state is InitialSearchState){
        isInitial = true;
      }else {
        isInitial = false;
      }
    });
    return WillPopScope(
      onWillPop: ()async{
        if(isInitial){
          return true;
        }else{
          _bloc.add(InitialSearchEvent());
          return false;
        }
      },
      child: BlocProvider.value(
        value: _bloc,
        child: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BlocBuilder(
                  cubit: _bloc,
                  builder: (context, state) {
                    if (state is InitialSearchState)
                      return SizedBox(
                        height: 75,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[
                              Text(
                                "چستجو پیشرفته",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(.38)),
                              ),
                            ],
                          ),
                        ),
                      );
                    else
                      return Container();
                  },
                ),

                Container(
                  color: Colors.white,
                  height: 65,
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  child: Container(
                    decoration: ShapeDecoration(
                        color: Colors.grey.withOpacity(.2),
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              icon: Icon(
                                Icons.search,
                                color: Colors.green,
                              ),
                              hintText: "جستجو",
                              hintStyle: TextStyle(fontSize: 13)),
                          onChanged: (str) {
                            _bloc.add(StartTimer(str: str, factor: factor));
                          },
                          textDirection: TextDirection.rtl,
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                    ),
                  ),
                ),
                BlocBuilder(
                  cubit: _bloc,
                  builder: (context, state) {
                    if (state is InitialSearchState)
                      return SizedBox(
                        height: 75,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[
                              Text(
                                "فیلتر ها",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(.38)),
                              ),
                            ],
                          ),
                        ),
                      );
                    else
                      return Container();
                  },
                ),
                BlocBuilder(
                  cubit: _bloc,
                  builder: (context, state) {
                    if (state is InitialSearchState)
                      return SearchFilter();
                    else return Container();}
                ),
                BlocBuilder(
                  cubit: _bloc,
                  builder: (context, state) {
                    if (state is InitialSearchState)
                      return Container();
                    else if (state is Empty) {
                      return Container(
                        height: MediaQuery.of(context).size.height -140,
                        child: Center(
                          child: Text("موردی یافت نشد."),
                        ),
                      );
                    } else if (state is Loaded) {
                      return Container(
                        height: MediaQuery.of(context).size.height -140,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: state.models.length,
                              itemBuilder: (context, index) {
                                return AdvertiseItem(
                                  state.models[index],
                                );
                              }),
                        ),
                      );
                    } else if (state is RequestLoading) {
                      return Container(
                          height: MediaQuery.of(context).size.height -140,
                          child: Center(child: CircularProgressIndicator()));
                    } else
                      return Container(
                        width: 5,
                        height: 5,
                      );
                  },
                ),

//                  state is InitialSearchState ?  Container() : Expanded(
//                    child: BlocBuilder(
//                        bloc: _bloc,
//                        builder: (context, state) {
//                          if(state is InitialSearchState){
//                            return Center(
//                              child: Text(ResString.wordSearch),
//                            );
//                          }else
//                          if (state is Empty) {
//                            return Center(
//                              child: Text(ResString.searchNotFound),
//                            );
//                          } else if (state is Loaded) {
//                            return Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: GridView.builder(
//                                  itemCount: state.models.length,
//                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                                  itemBuilder: (context, index) {
//                                    return VitrinListItem(model: state.models[index],);
//                                  }),
//                            );
//                          } else if(state is RequestLoading){
//                            return Center(child: CircularProgressIndicator());
//                          }else
//                            return Container(
//                              width: 5,
//                              height: 5,
//                            );
//                        }),
//                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//  Widget bottomSheetButton(context,{String text,int id}){
//    return FlatButton(
//      onPressed: (){
//        factor = id;
//        Navigator.pop(context);
//        if(controller.text != ''){
//          _bloc.add(SearchEvent(str: controller.text,factor: id));
//        }
//      },
//      child: Container(
//        width: double.maxFinite,
//        height: 55,
//        child: Center(
//          child: Text(
//            text,
//          ),
//        ),
//      ),
//    );
//  }
//  void _modalBottomSheetSort(context) {
//    showModalBottomSheet(
//        context: context,
//        builder: (builder) {
//          return SingleChildScrollView(
//            child: new Container(
//              color: Colors.white,
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Padding(padding: EdgeInsets.only(top: 20.0)),
//                  Text(ResString.searchFilter,),
//                  Padding(padding: EdgeInsets.only(top: 20.0,bottom: 10)),
//                  Container(
//                    width: 500.0,
//                    color: Colors.black26,
//                    height: 0.5,
//                  ),
//                  bottomSheetButton(context,text: ResString.searchAll,id: 0),
//                  bottomSheetButton(context,text: ResString.searchNewest,id: 1),
//                  bottomSheetButton(context,text: ResString.searchSpecial,id: 2),
//                  bottomSheetButton(context,text: ResString.searchMostDiscount,id: 3),
//                  bottomSheetButton(context,text: ResString.searchMostViewd,id: 2),
//                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
//                ],
//              ),
//            ),
//          );
//        });
//
//  }
}
