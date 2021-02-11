import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iranpasman/master_bloc/bloc.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/network.dart';
import './bloc.dart';

class AdvertiseBloc extends Bloc<AdvertiseEvent, MasterState> {

  AdvertiseBloc(MasterState initialState) : super(initialState);


  @override
  Stream<MasterState> mapEventToState(
    AdvertiseEvent event,
  ) async* {
    if(event is GetAdvertise){
      NetworkProvider provider = NetworkProvider();
      Ad ad = await provider.getSingleAd(id : int.parse(event.id));
      add(ShowAdEvent(ad));
    }else if(event is ShowAdEvent){
      yield ShowProduct(event.ad);
    }
    // TODO: Add Logic
}
}
