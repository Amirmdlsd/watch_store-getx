import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:watch_store_getx/feature/utils/auth_manager.dart';

class DioProvider {
  DioProvider._();

  static final DioProvider _instance = DioProvider._();

  factory DioProvider() {
    return _instance;
  }

  final Dio _dio = Dio();

  Dio get dio => _dio;

  dynamic getMethod(String url) {
    return _dio.get(url);
  }

  dynamic postMethod(Map<String, dynamic> map, String url) {
    String token = AuthManager.readToken();
    if (token.isNotEmpty) {
      debugPrint(AuthManager.readToken().toString());
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    return _dio.post(url, data: FormData.fromMap(map));
  }
}