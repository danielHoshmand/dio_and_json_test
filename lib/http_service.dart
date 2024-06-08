import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpService {
  late Dio _dio;

  final baseUrl = 'https://reqres.in/';

  HttpService() {
    // Can modify header here
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        debugPrint(error.message);
      },
      onRequest: (options, handler) {
        debugPrint('${options.method} ${options.path}');
      },
      onResponse: (response, handler) {
        debugPrint(response.data);
      },
    ));
  }
}
