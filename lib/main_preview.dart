// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:loggy/loggy.dart';
// import 'package:device_preview/device_preview.dart';
// import 'config/logger_config.dart';
// import 'config/gen/assets.gen.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// // This file 

// void main() async {
//   // init environment data
//   await dotenv.load(fileName: Assets.envs.envProd);

//   // init logging
//   LoggerConfig.init(const LogOptions(LogLevel.error));

//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();

//   runApp(DevicePreview(
//     enabled: true,
//     builder: (context) => MyApp(), // Wrap your app
//   ));
// }
