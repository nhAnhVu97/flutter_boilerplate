import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_project_boilerplate/core/shared/utils/colorize.dart';

class AppLogger {
  static void d(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      final coloredMessage = Colorize('[D] - $message').apply(Styles.green);
      log('$coloredMessage', stackTrace: stackTrace);
    }
  }

  static void w(dynamic message, {StackTrace? stackTrace}) {
    final coloredMessage = Colorize('[W] - $message').apply(Styles.yellow);
    log('$coloredMessage', stackTrace: stackTrace);
  }

  static void e(dynamic message, {StackTrace? stackTrace}) {
    final coloredMessage = Colorize('[E] - $message').apply(Styles.red);
    log('$coloredMessage', stackTrace: stackTrace);
  }
}
