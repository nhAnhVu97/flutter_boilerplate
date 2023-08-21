import 'package:flutter_project_boilerplate/core/data/apis/api_client.dart';
import 'package:flutter_project_boilerplate/core/data/apis/dio/dio_provider.dart';
import 'package:flutter_project_boilerplate/core/data/repositories/user_repositories.dart';
import 'package:flutter_project_boilerplate/core/routes/app_router.dart';
import 'package:flutter_project_boilerplate/core/shared/cubits/theme/theme_cubit.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector
    ..registerSingleton<AppRouter>(AppRouter())
    ..registerSingleton<DioProvider>(DioProvider())
    ..registerSingleton<ApiClient>(ApiClient(injector.get<DioProvider>().getInstance()))
    ..registerSingleton<ThemeCubit>(ThemeCubit())
    ..registerFactory<UserRepository>(UserRepository.new);
}
