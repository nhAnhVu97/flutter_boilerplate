import 'package:auto_route/auto_route.dart';
import 'package:flutter_project_boilerplate/core/routes/app_router.dart';
import 'package:flutter_project_boilerplate/injector_setup.dart';

class AppNavigator {
  static final router = injector<AppRouter>();

  static Future<T?> to<T extends Object?>(PageRouteInfo screen) async {
    return router.push<T>(screen);
  }

  static Future<T?> off<T extends Object?>(PageRouteInfo screen) async {
    return router.replace<T>(screen);
  }
}
