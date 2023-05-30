import 'package:flutter_starter/src/core/config/gen/assets.gen.dart';
import 'package:flutter_starter/src/core/config/logger_config.dart';
import 'package:loggy/loggy.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'main.dart';

void main() async {
  await dotenv.load(fileName: Assets.envs.envProfile);
  LoggerConfig.init(const LogOptions(LogLevel.info));
  await runMainApp();
}
