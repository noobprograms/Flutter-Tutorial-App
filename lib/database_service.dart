import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'products';

  static final productId = 'pID';
  static final productName = "Name";
  static final productPrice = "Price";

  //creating the database
  static dynamic _database; //i have used dynamic instead of Database type
  //here because the Database type cant be null and the compiler asked me to initialize _database which i can't
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print('the path here is ${directory.path}');
    String path = join(directory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _createFunc);
  }

  Future _createFunc(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName(
        $productId INTEGER PRIMARY KEY,
        $productName TEXT,
        $productPrice TEXT    
      )
      ''');
  }

  //inserting into the databse
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  //writing the query command
  Future<List<Map<String, dynamic>>> queryCommand() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  //writing the update command
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[productId];
    return await db
        .update(_tableName, row, where: 'productId = ?', whereArgs: [id]);
  }

  //writing the delete command
  Future<int> deleteProd(int pId) async {
    Database db = await instance.database;
    return await db
        .delete(_tableName, where: 'productId = ?', whereArgs: [pId]);
  }
}
