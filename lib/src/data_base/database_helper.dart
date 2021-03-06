import 'dart:async';
import 'package:path/path.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  //COLUMN
  final String tableProduct = 'tableProduct';
  final String tableFavourite = 'tableFavourite';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnImage = 'image';
  final String columnPrice = 'price';
  final String columnBasePrice = 'base_price';
  final String columnDescription = 'description';
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
    String path = join(databasesPath, 'login.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    // user
    await db.execute(
      'CREATE TABLE $tableProduct('
          '$columnId INTEGER PRIMARY KEY, '
          '$columnName TEXT, '
          '$columnImage TEXT, '
          '$columnPrice REAl, '
          '$columnDescription TEXT, '
          '$columnCount INTEGER, '
          '$columnBasePrice REAl)',
    );
    await db.execute(
      'CREATE TABLE $tableFavourite('
          '$columnId INTEGER PRIMARY KEY, '
          '$columnName TEXT, '
          '$columnImage TEXT, '
          '$columnPrice REAl, '
          '$columnDescription TEXT, '
          '$columnCount INTEGER, '
          '$columnBasePrice REAl)',
    );
  }

  //user save
  Future<int> saveProduct(DrugsResult item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableProduct,
      item.toJson(),
    );
    return result;
  }

  //user get
  Future<List<DrugsResult>> getDrugsDatabase() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableProduct');
    List<DrugsResult> products = <DrugsResult>[];
    for (int i = 0; i < list.length; i++) {
      var items = DrugsResult(
        id: list[i][columnId],
        name: list[i][columnName],
        image: list[i][columnImage],
        price: list[i][columnPrice],
        basePrice: list[i][columnBasePrice],
        cardCount: list[i][columnCount],
        description: list[i][columnDescription],
      );
      products.add(items);
    }
    return products;
  }

  //user update
  Future<int> updateProduct(DrugsResult item) async {
    var dbClient = await db;
    return await dbClient.update(
      tableProduct,
      item.toJson(),
      where: "$columnId = ?",
      whereArgs: [item.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableProduct,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  ///user FAV
  Future<List<DrugsResult>> getDrugsFavDatabase() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableFavourite');
    List<DrugsResult> products = <DrugsResult>[];
    for (int i = 0; i < list.length; i++) {
      var items = DrugsResult(
        id: list[i][columnId],
        name: list[i][columnName],
        image: list[i][columnImage],
        price: list[i][columnPrice],
        basePrice: list[i][columnBasePrice],
        description: list[i][columnDescription],
        favSelected: true,
      );
      products.add(items);
    }
    return products;
  }

  ///delete fav
  Future<int> deleteFavProduct(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableFavourite,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  ///save fav
  Future<int> saveFavProduct(DrugsResult item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableFavourite,
      item.toJson(),
    );
    return result;
  }
}
