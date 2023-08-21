import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment {
  developement,
  staging,
  production,
}

class AppConfig {
  static String get baseUrl => dotenv.get('BASE_URL');
  static Environment get flavor => Environment.values.firstWhere((element) => element.name == dotenv.get('FLAVOR'));
}
