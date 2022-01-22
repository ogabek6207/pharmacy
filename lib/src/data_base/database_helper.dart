import 'dart:async';
import 'package:path/path.dart';
import 'package:pharmacy/src/model/database/data_base_model.dart';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableNote = 'cardTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnImage = 'image';
  final String columnPrice = 'price';
  final String columnBasePrice = 'base_price';
  final String columnManufacturer = 'manufacturer';
  final String columnCount = 'card_count';

     static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
      if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }


  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pepgvardiola.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute  ('CREATE TABLE $tableNote('
        '$columnId INTEGER PRIMARY KEY, '
        '$columnName TEXT, '
        '$columnImage TEXT, '
        '$columnPrice REAL, '
        '$columnBasePrice REAL, '
        '$columnManufacturer TEXT, '
        '$columnCount INTEGER)');
  }

  Future<int> saveProducts(CardDatabaseModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableNote,
      item.toJson(),
    );
    return result;
  }

  Future<List<CardDatabaseModel>> getProduct() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableNote');
    List<CardDatabaseModel> products = <CardDatabaseModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = CardDatabaseModel(
        id: list[i][columnId],
        name: list[i][columnName],
        image: list[i][columnImage],
        cardCount: list[i][columnCount],
        manufacturer: list[i][columnManufacturer],
        price: list[i][columnPrice],
        basePrice: list[i][columnBasePrice],
      );
      products.add(items);
    }
    return products;
  }

  Future<int> deleteProducts(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableNote,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateProduct(CardDatabaseModel products) async {
    var dbClient = await db;
    return await dbClient.update(
      tableNote,
      products.toJson(),
      where: "$columnId = ?",
      whereArgs: [products.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableNote');
  }
}
