import 'package:dio/dio.dart';

import 'package:flutter_project_boilerplate/core/configs/app_config.dart';
import 'package:flutter_project_boilerplate/core/data/apis/dio/interceptors/dio_log_interceptor.dart';

class DioProvider {
  Dio? dio;

  void setHeaderToken(String token) {
    dio!.options.headers['Authorization'] = 'Bearer $token';
  }

  void setHeaderVersion(String version) {
    dio!.options.headers['version'] = version;
  }

  void removeHeaderToken() {
    dio!.options.headers['Authorization'] = '';
  }

  Dio getInstance() {
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = AppConfig.baseUrl;
      dio!.options.connectTimeout = const Duration(seconds: 60);
      dio!.options.contentType = 'application/json';

      dio!.interceptors.add(DioLogInterceptor());
    }

    return dio!;
  }
}
