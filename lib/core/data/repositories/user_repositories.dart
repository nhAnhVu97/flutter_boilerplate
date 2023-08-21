import 'package:flutter_project_boilerplate/core/data/apis/api_client.dart';
import 'package:flutter_project_boilerplate/core/data/apis/dio/helpers/api_result.dart';
import 'package:flutter_project_boilerplate/core/data/apis/dio/helpers/safe_api_call.dart';
import 'package:flutter_project_boilerplate/core/data/models/user_model.dart';
import 'package:flutter_project_boilerplate/injector_setup.dart';

class UserRepository {
  final _apiClient = injector.get<ApiClient>();

  Future<ApiResult<UserModel>> getUser(int id) async {
    return safeApiCall(_apiClient.getUser(id));
  }
}
