import 'package:dio/dio.dart';

abstract class ApiResult<T> {
  ApiResult({
    this.data,
    this.error,
    this.response,
  });

  T? data;
  String? error;
  Response<dynamic>? response;
}

class ApiSuccess<T> extends ApiResult<T> {
  ApiSuccess({required super.data});
}

class ApiError<T> extends ApiResult<T> {
  ApiError({
    required String super.error,
    super.response,
  });
}
