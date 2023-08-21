import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_boilerplate/app.dart';
import 'package:flutter_project_boilerplate/core/data/locals/hive_storage.dart';
import 'package:flutter_project_boilerplate/core/shared/cubits/theme/theme_cubit.dart';
import 'package:flutter_project_boilerplate/core/shared/utils/app_logger.dart';
import 'package:flutter_project_boilerplate/core/shared/utils/cubit_observer.dart';
import 'package:flutter_project_boilerplate/injector_setup.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    AppLogger.e(details.exceptionAsString(), stackTrace: details.stack);
  };

  if (kDebugMode) {
    Bloc.observer = CubitObserver();
  }

  // Init localization
  await EasyLocalization.ensureInitialized();

  // Init dependencies
  await initializeDependencies();

  // Local storage
  await HiveStorage.init();

  // Load saved theme
  await injector.get<ThemeCubit>().loadTheme();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      child: const App(),
    ),
  );
}
