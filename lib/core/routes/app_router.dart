import 'package:auto_route/auto_route.dart';
import 'package:flutter_project_boilerplate/modules/splash/splash_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: SplashRoute.page, path: '/'),
      ];
}
