import 'dart:convert';

import 'package:pas_mobile_11pplg2_01/models/tvshow_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<void> initDatabase() async {
    await db;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bookmarked.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE bookmarked(
          id INTEGER PRIMARY KEY,
          name TEXT)''');
      },
    );
  }

  // Just For Check database
  Future<void> printAllData() async {
    final data = await db;
    final List<Map<String, dynamic>> results = await data.query('bookmarked');
    print('Total records: ${results.length}');
    for (var row in results) {
      print(row);
    }
  }

  // Add data
  Future<int> insertBookmark(TvShowModel tvShow) async {
    final client = await db;
    return client.insert('bookmarked', {
      'id': tvShow.id,
      'name': jsonEncode(tvShow.toJson()),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // // Update data
  // Future<int> updateFavorite(ProductModel product) async {
  //   final client = await db;
  //   return await client.update(
  //     'favorites',
  //     {'id': product.id, 'isFavorite': product.isFavorite ? 1 : 0},
  //     where: 'id = ?',
  //     whereArgs: [product.id],
  //   );
  // }

  // Get data
  Future<List<TvShowModel>> getList() async {
    final client = await db;
    final List<Map<String, dynamic>> data = await client.query('bookmarked');

    return data.map((row) {
      return TvShowModel.fromJson(jsonDecode(row["data"]));
    }).toList();
  }

  //Delete task berdasarkan ID
  Future<int> deleteById(int id) async {
    final client = await db;
    return await client.delete('bookmarked', where: 'id = ?', whereArgs: [id]);
  }

  //Delete semua task
  Future<void> deleteAllCompleted() async {
    final client = await db;
    await client.delete('bookmarked', where: 'name = ?', whereArgs: []);
  }

  // // uppdate isCompleted When complete menu tapped
  // Future<void> updateIsCompleted(int id, int isFavorite) async {
  //   final client = await db;
  //   await client.update(
  //     'favorites',
  //     {'isFavorite': isFavorite},
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
}
