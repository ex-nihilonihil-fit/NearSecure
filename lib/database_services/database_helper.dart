// Adapted from:
// https://stackoverflow.com/questions/54097326/how-to-do-a-database-insert-with-sqflite-in-flutter

import 'dart:core';
import 'dart:io' show Directory;
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;

class DatabaseHelper {

  final DatabaseHelper databaseHelper= DatabaseHelper();

  static const _databaseName = "database.db";
  static const _databaseVersion = 1;

  static const table = 'nfc_events';

  static const columnId = 'id';
  static const columnRawData = 'rawData';
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
    // print(path); TODO: remove this line
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnRawData TEXT NOT NULL,
            $columnLoc INTEGER NOT NULL
          )
          ''');
  }

    // Helper methods

    // Add the raw and location data to the database in a new sequential row.
    Future<int> insert(String rawData, int loc) async {
      Database? db = await database;
      return await db!.insert(
          table, {columnRawData: rawData, columnLoc: loc});
    }

    // Get all of the data from the database.
    Future<List<Map<String, dynamic>>> queryAllRows() async {
      Database? db = await database;
      return await db!.query(table);
    }

    // Query the raw data column for a specified string.
    Future<List<Map<String, dynamic>>> queryRawData(String rawData) async {
      Database? db = await database;
      return await db!.query(table, where: '$columnRawData = ?', whereArgs: [rawData]);
    }

    // Perform a raw query on the database.
    Future<List<Map<String, dynamic>>> rawQuery(String query) async {
      Database? db = await database;
      return await db!.rawQuery(query);
    }


    // Get the data from the database in a specific row.
    Future<List<Map<String, dynamic>>> queryRow(int id) async {
      Database? db = await database;
      return await db!.query(table, where: '$columnId = ?', whereArgs: [id]);
    }

    // Delete the database
    Future<int> delete(int id) async {
      Database? db = await database;
      return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
    }
}

