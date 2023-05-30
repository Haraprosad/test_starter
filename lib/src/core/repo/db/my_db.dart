// import 'dart:async';

// import 'package:flutter_starter/my_env.dart';
// import 'package:injectable/injectable.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sembast/sembast.dart';
// import 'package:sembast/sembast_io.dart';

// @lazySingleton
// class MyDatabase {
//   Completer<Database> _dbOpenCompleter;

//   // Database object accessor
//   Future<Database> get database async {
//     if (_dbOpenCompleter == null) {
//       _dbOpenCompleter = Completer();
//       _openDatabase();
//     }
//     return _dbOpenCompleter.future;
//   }

//   Future _openDatabase() async {
//     final appDocumentDir = await getApplicationDocumentsDirectory();
//     final dbPath = join(appDocumentDir.path, 'yebook.db');
//     // Initialize the encryption codec with a user password
//     // var codec = getEncryptSembastCodec(password: _environment.getPassword());
//     final database = await databaseFactoryIo.openDatabase(dbPath);
//     _dbOpenCompleter.complete(database);
//   }
// }
