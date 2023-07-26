import 'dart:core';
import 'dart:io' show Directory;
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'dart:async';

class DatabaseHelper {

  static const _databaseName = "database.db";
  static const _databaseVersion = 1;

  static const table = 'nfc_events';

  static const columnTime = 'time';
  static const columnId = 'id';
  static const columnNfcData = 'nfcData';
  static const columnLoc = 'loc';

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnTime VARCHAR(50) NOT NULL,
            $columnId VARCHAR(50) NOT NULL,
            $columnNfcData VARCHAR(50) NOT NULL,
            $columnLoc VARCHAR(50) NOT NULL
          )
          ''');
  }

  //*** Helper methods ***//

  // Add time, NFC data, and location data to the database in a new sequential row.
  Future<int> insert(String time, String id, String nfcData, String loc) async {
    Database? db = await database;
    // get the current time without seconds and milliseconds
    Map<String, dynamic> row = {
      columnTime: time,
      columnId: id,
      columnNfcData: nfcData,
      columnLoc: loc
    };
    return await db!.insert(table, row);
  }

  // Get all of the data from the database.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await database;
    return await db!.query(table);
  }

  // Query the raw data column for a specified string.
  Future<List<Map<String, dynamic>>> queryNfcData(String nfcData) async {
    Database? db = await database;
    return await db!.query(table, where: '$columnNfcData = ?', whereArgs: [nfcData]);
  }

  // Perform a raw query on the database.
  Future<List<Map<String, dynamic>>> rawQuery(String query) async {
    Database? db = await database;
    return await db!.rawQuery(query);
  }

  // Get the data from only the time, id, and nfcData columns.
  Future<List<Map<String, dynamic>>> queryTimeIdNfcData() async {
    Database? db = await database;
    return await db!.query(table, columns: [columnTime, columnId, columnNfcData]);
  }

  // Get the data from only the location column.
  Future<List<Map<String, dynamic>>> queryLoc() async {
    Database? db = await database;
    return await db!.query(table, columns: [columnLoc]);
  }

  // Get the data from the database in a specific row.
  Future<List<Map<String, dynamic>>> queryRow(int id) async {
    Database? db = await database;
    return await db!.query(table, where: '$columnId = ?', whereArgs: [id]);
  }

  // Delete the database
  Future<int> delete() async {
    Database? db = await database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [1]);
  }
}
