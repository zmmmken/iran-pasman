import 'dart:convert';

import 'package:localstorage/localstorage.dart';


class Storage {
  static final Storage _singleton = Storage._internal();

  LocalStorage storage =LocalStorage("MyStorage.json");
  factory Storage() => _singleton;
  Storage._internal();


  final String _TOKEN = 'TOKEN';
  final String _likeProduct = 'LIKEPRODUCT';
  final String _basketProduct = 'BASKETPRODUCT';


  void removeAll() {
    storage.setItem(_TOKEN, null);
  }

  set token(String value){
    storage.setItem(_TOKEN, value);
  }

  get token{
    return storage.getItem(_TOKEN);
  }

}
