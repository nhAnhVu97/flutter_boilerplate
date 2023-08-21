import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project_boilerplate/bootstrap.dart';
import 'package:flutter_project_boilerplate/core/shared/utils/app_logger.dart';

void main() async {
  await dotenv.load(fileName: ".env.dev");
  AppLogger.d('ENV: ${dotenv.env}');
  bootstrap();
}
