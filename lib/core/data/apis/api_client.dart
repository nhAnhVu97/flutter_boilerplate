import 'package:dio/dio.dart';
import 'package:flutter_project_boilerplate/core/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/users/{id}')
  Future<UserModel> getUser(@Path('id') int id);
}
