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

  // Get data
  Future<List<TvShowModel>> getList() async {
    final client = await db;
    final List<Map<String, dynamic>> data = await client.query(
      'bookmarked',
      orderBy: 'id DESC',
    );
    return tvShowModelFromJson(jsonEncode(data)).toList();
  }

  //Delete task berdasarkan ID
  Future<int> deleteById(int id) async {
    final client = await db;
    return await client.delete('bookmarked', where: 'id = ?', whereArgs: [id]);
  }

  //Delete semua task
  Future<void> deleteAllCompleted() async {
    final client = await db;
    await client.delete(
      'bookmarked',
      where: 'isBookmarked = ?',
      whereArgs: [1],
    );
  }

  // // Check if ID is bookmarked - FIXED: Tambah method helper
  // Future<bool> isBookmarked(int id) async {
  //   final client = await db;
  //   final result = await client.query(
  //     'bookmarked',
  //     where: 'id = ? AND isBookmarked = ?',
  //     whereArgs: [id, 1],
  //   );
  //   return result.isNotEmpty;
  // }
}
