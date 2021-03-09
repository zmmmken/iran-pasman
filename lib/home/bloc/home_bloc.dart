import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:iranpasman/Error/error.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/master_bloc/bloc.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/models/ad_types.dart';
import 'package:iranpasman/models/daily_price_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, MasterState> {
  HomeBloc() : super(HomeTab(0));

  HomeRepository repository =  HomeRepository();

  AdTypes selectedType = AdTypes.BUY;


  @override
  Stream<MasterState> mapEventToState(
    HomeEvent event,
  ) async* {
    if(event is ChangeHomeTab){
      selectedType = event.adType;
      yield ShowLoading();
      try{
        await repository.getAds(event.adType);
        if(repository.ads[event.adType].length == 0){
          yield NoData();
        }else yield ShowHomeData(repository.ads[event.adType]);
      }catch(e){
        if(e is PublicException){
          yield OtherError();
        }else if (e is TokenException){
          yield TokenError();
        }else if(e is ConnectionException){
          yield NetworkError();
        }
      }
    }
    else if(event is GetMoreHomeData){
      yield LoadMoreData(repository.ads[event.adType]);
      try{
        await repository.getAds(event.adType);
        if(repository.ads[event.adType].length == 0){
          yield NoData();
        }else yield ShowHomeData(repository.ads[event.adType]);
      }catch(e){
        if(e is PublicException){
          yield OtherError();
        }else if (e is TokenException){
          yield TokenError();
        }else if(e is ConnectionException){
          yield NetworkError();
        }
      }
    }
  }
}
