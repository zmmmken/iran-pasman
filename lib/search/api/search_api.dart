
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:iranpasman/fake_data.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/network.dart';

class SearchApi{
  static final SearchApi _singleton = SearchApi._internal();

  factory SearchApi() => _singleton;

  SearchApi._internal();

  Future<List<Ad>> getSearchResult({@required param}) async {
    return await NetworkProvider().getAds(keywords: param["title"]);
//    return await Network().sendRequest(
//        'asa-card/centers/search-centers', RequestType.Post,param);
  }
}