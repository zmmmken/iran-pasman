import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:iranpasman/add_advertise/screen/category/buy/bloc/bloc.dart';
import 'package:iranpasman/local_storage.dart';
import 'package:iranpasman/models/Ad.dart';
import 'package:iranpasman/models/ad_types.dart';
import 'package:iranpasman/models/base_result.dart';
import 'package:iranpasman/models/category.dart';
import 'package:iranpasman/models/value_unit.dart';

import 'models/city.dart';

class NetworkProvider {
  static final NetworkProvider _singleton = NetworkProvider._internal();

  static Dio dio;

  factory NetworkProvider() {
// or new Dio with a BaseOptions instance.
    BaseOptions options = new BaseOptions(
      baseUrl: "https://zayeat.dzakhm.com/public/api/v1",
      // connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
    return _singleton;
  }

  NetworkProvider._internal();

  Map<AdTypes, String> types = {
    AdTypes.BUY: "buy",
    AdTypes.SELL: "sell",
    AdTypes.AUCTION: "auction",
  };

  //location Api
  Future<List<City>> getAllState() async {
    var response = await dio.get('/state/all');
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    List temp = baseResponse.data as List;
    List<City> states = temp.map((e) => City.fromJson(e)).toList();
    return states;
  }

  Future getAllCity() async {
    var response = await dio.get('/city/all');
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    List temp = baseResponse.data as List;
    List<City> cities = temp.map((e) => City.fromJson(e)).toList();
    return cities;
  }

  Future getCityByStateId(int id) async {
    var response = await dio.get('/city/allByStateId/' + id.toString());
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    List temp = baseResponse.data as List;
    List<City> cities = temp.map((e) => City.fromJson(e)).toList();
    return cities;
  }

  // Category Api
  Future getAllCategory() async {
    var response = await dio.get('/category/all');
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    List temp = baseResponse.data as List;
    List<Category> categories = temp.map((e) => Category.fromJson(e)).toList();
    return categories;
  }

  Future getSingleCategory() async {}

  Future getRootCategory() async {
    var response = await dio.get('/category/root');
    var data = response.data;

    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    List temp = baseResponse.data as List;
    List<Category> categories = temp.map((e) => Category.fromJson(e)).toList();
    return categories;
  }

  //Unit Api
  Future<List<ValueUnit>> getPriceUnit() async {
    var response = await dio.get('/price-unit');
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    List temp = baseResponse.data as List;
    List<ValueUnit> units = temp.map((e) => ValueUnit.fromJson(e)).toList();
    return units;
  }

  Future<List<ValueUnit>> getValueUnit() async {
    var response = await dio.get('/value-unit');
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    List temp = baseResponse.data as List;
    List<ValueUnit> units = temp.map((e) => ValueUnit.fromJson(e)).toList();
    return units;
  }

  //Ad Api
  Future AddAds() async {}

  Future<List<Ad>> getAds({
    int state,
    int city,
    int category,
    String keywords,
    int priceUnit,
    int valueUnit,
    int priceFrom,
    int priceTo,
    int page,
    AdTypes type,
  }) async {
    Map<String, dynamic> params = {
      "page[per_page]": 15,
      "page[number]": page,
      "type": types[type],
      "city": city,
      "state": state,
      "price[from]": priceFrom,
      "price[to]": priceTo,
      "keywords": keywords,
      "category": category
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);

    var response = await dio.get('/agahi', queryParameters: params);
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    List temp = baseResponse.data as List;
    List<Ad> ads = temp.map((e) => Ad.fromJson(e)).toList();
    return ads;
  }

  Future<Ad> getSingleAd({int id}) async {
    var response = await dio.get('/agahi' + id.toString());
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);

    Ad ad = Ad.fromJson(baseResponse.data);
    return ad;
  }

  Future<BaseResponse> addAdvertise(MyBuyBloc _bloc) async {

    List<MultipartFile> imageList = [];
    for (int i = 0; i < _bloc.images.length; i++) {
      imageList.add(await MultipartFile.fromFile(_bloc.images[i].path));
    }



    FormData formData = FormData.fromMap(
      {
        "images" : imageList,
        "title" : _bloc.titleController.text,
        "description" : _bloc.descriptionController.text,
        "category_id" : _bloc.selectedCategory.id,
        "price_unit_id" : _bloc.selectedPriceUnit.id,
        "value_unit_id" : _bloc.selectedWeightUnit.id,
        "type" : "buy",
        "amount" : 10,
        "price" : 10000
      }
    );
    
    
    var res = await dio.post('/agahi/store',data:formData,options: Options(
      headers: {
        "Authorization" : "Bearer "+ Storage().token
      },
    ), onSendProgress: (sent,all){
      print((sent/all).toString());
    });
    
    // for (int i = 0; i < _bloc.images.length; i++) {
    //   formData.files.add(MapEntry(
    //       'images', await MultipartFile.fromFile(_bloc.images[i].path)));
    // }



    print(formData);
  }

  //Authentication
  Future<BaseResponse> login(String phoneNumber) async {
    var response = await dio.post('/login', data: {"mobile": phoneNumber});
    debugPrint("${response.statusCode}");
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    return baseResponse;
  }

  Future<BaseResponse> verify(String phoneNumber, String code) async {
    var response =
        await dio.post('/verify', data: {"mobile": phoneNumber, "code": code});
    var data = response.data;
    BaseResponse baseResponse =
        BaseResponse.fromJson(data as Map<String, dynamic>);
    return baseResponse;
  }
}
