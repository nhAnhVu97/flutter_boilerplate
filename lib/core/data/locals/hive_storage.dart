import 'package:flutter_project_boilerplate/core/shared/utils/app_logger.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static const String appBoxKey = 'app_box';
  static const String theme = 'theme';

  static late Box<dynamic> _appBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    _appBox = await Hive.openBox(appBoxKey);
    AppLogger.d('${_appBox.toMap()}');
  }

  static Future<dynamic> getByKey(String key, dynamic defaultValue) async {
    return _appBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> setByKey(String key, dynamic value) async {
    return _appBox.put(key, value);
  }
}
