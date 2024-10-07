import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sausage_roll/core/sausage_roll_app.dart';
import 'package:sembast/sembast_io.dart';

@Singleton()
class CustomSembastDatabase {
  CustomSembastDatabase();

  Completer<Database>? _dbOpenCompleter;

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    final appDocumnetDir = await getApplicationDocumentsDirectory();

    final dbPath = join(appDocumnetDir.path, 'basket.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter!.complete(database);
  }
}
