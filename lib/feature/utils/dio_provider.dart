import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:watch_store_getx/feature/utils/auth_manager.dart';

class DioProvider {
  static final Dio dio = Dio();
static dynamic getMethod(String url){
  return dio.get(url);
}
  static dynamic postMethod(Map<String, dynamic> map, String url) {
    if(AuthManager.readToken().isNotEmpty){
      debugPrint(AuthManager.readToken().toString());
      dio.options.headers['Authorization']='Bearer ${AuthManager.readToken()}';
    }
    return dio.post(url, data: FormData.fromMap(map));
  }
}
