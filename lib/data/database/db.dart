import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final todoTABLE = 'Todo';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "ReactiveTodo.db");
    var database = await openDatabase(path, version: 1, onCreate: initDB);
    return database;
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $todoTABLE ("
        "id INTEGER PRIMARY KEY, "
        "name TEXT, "
        "description TEXT, "
        "time TEXT, "
        "monthYear TEXT, "
        "location TEXT, "
        "color INTEGER, "
        "date TEXT "
        ")");
  }
}
