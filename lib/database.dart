import 'package:sqflite/sqflite.dart';
// https://pub.dev/packages/sqflite

class DataBase {
  static final DataBase _instance = DataBase._internal();
  factory DataBase() => _instance;
  DataBase._internal();

  static Database? _db = null;
  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await init();
    return _db;
  }

  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'rf_block.db';
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE rf_block (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        value TEXT NOT NULL
      )
    ''');
  }

  Future<int?> insertRecord(Map<String, dynamic> value) async {
    var dbClient = await db;
    return await dbClient?.insert('rf_block', value);
  }

  Future<List<Map<String, Object?>>?> getRecords() async {
    var dbClient = await db;
    return await dbClient?.query('rf_block');
  }
}