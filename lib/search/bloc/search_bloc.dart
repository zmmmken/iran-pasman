import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/search/repository/search_repository.dart';
import './bloc.dart';

class SearchBloc extends Bloc<MasterSearchEvent, SearchState> {
  SearchRepository _repository = SearchRepository();
  List<bool> factors = [true,false,false,false,false];
  Timer timer ;
  String str='';

  static String searchMostViewed = "بیشترین بازدید";
  static String searchMostDiscount = "بیشترین تخفیف";
  static String searchNewest = "جدیدترین";
  static String searchSpecial = "ویژه ها";

  SearchBloc(SearchState initialState) : super(initialState);
  Map<String,bool> filter = {
    searchMostViewed : false,
    searchMostDiscount : false,
    searchNewest : false,
    searchSpecial : false,
  };


  @override
  Stream<SearchState> mapEventToState(
      MasterSearchEvent event,
  ) async* {

    // TODO: Add Logic

    if(event is StartTimer){
      yield RequestLoading();
      str = event.str;
      if(str != ""){
        if(timer!= null && timer.isActive){
        timer.cancel();
        }
        timer =  Timer(Duration(milliseconds: 1500), (){
          add(SearchEvent(factor: event.factor,str: event.str));
        });
      }else {
        yield InitialSearchState();
      }
    }else
      if(event is SearchEvent){
      updateList(event.factor);
      try{
        List<Ad> result = await getSearchResult(event.str);
        if(str==''){
          yield InitialSearchState();
        }else{
          if(result.length==0){
            yield Empty();
          }else yield Loaded(models: result);
        }

      }catch (e){
        yield RequestRejected();
      }
    }else if(event is InitialSearchEvent){
        yield InitialSearchState();
      }
  }
  Future<List<Ad>> getSearchResult(String text) async {
    return await _repository.getSearchResult({
      "title": text,
      "newest":         filter[searchNewest] ,
      "mostPints":      filter[searchSpecial]  ,
      "mostDiscounted": filter[searchMostDiscount]  ,
      "mostViewed":     filter[searchMostViewed]  ,
    });

  }

  updateList(int id){
    for(int i=0 ; i < factors.length ;i++){
      if(i==id){
        factors[i] = true;
      }else factors[i] = false;
    }
  }


}
