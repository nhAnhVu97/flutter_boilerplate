import 'package:dio/dio.dart';
import 'package:flutter_project_boilerplate/core/data/apis/dio/helpers/api_result.dart';

Future<ApiResult<T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final response = await apiCall;
    return ApiSuccess<T>(data: response);
  } catch (e) {
    var errorMessage = 'Internal server error';
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timeout';
        case DioExceptionType.connectionError:
          errorMessage = 'Connection error';
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Receive timeout';
        case DioExceptionType.sendTimeout:
          errorMessage = 'Send timeout';
        case DioExceptionType.badResponse:
          errorMessage = 'Server responded with error';
        case DioExceptionType.cancel:
          errorMessage = 'Request cancelled';
        case DioExceptionType.badCertificate:
          errorMessage = 'Bad certificate';
        case DioExceptionType.unknown:
          errorMessage = 'Unknown error';
      }
      return ApiError(error: errorMessage, response: e.response);
    } else {
      errorMessage = e.toString();
      return ApiError(error: errorMessage);
    }
  }
}
