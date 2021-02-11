import 'dart:convert';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/search/api/search_api.dart';

class SearchRepository{
  Future<List<Ad>> getSearchResult(Map<String,dynamic> data) async {
//    var params = jsonEncode(data);
//    String s = await Pref().phoneNumber;
    List<Ad> response = await SearchApi().getSearchResult(param: data);
    return response;
  }
}