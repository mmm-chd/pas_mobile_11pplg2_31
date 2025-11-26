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
          data TEXT)''');
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
    try {
      final client = await db;
      final result = await client.insert('bookmarked', {
        'id': tvShow.id,
        'data': jsonEncode(tvShow.toJson()), // ✅ Simpan seluruh object
      }, conflictAlgorithm: ConflictAlgorithm.replace);
      print('✅ Bookmark inserted: ${tvShow.name} with result: $result');
      return result;
    } catch (e) {
      print('❌ Error inserting bookmark: $e');
      return -1;
    }
  }

  // Get data
  // Get data - FIXED with better null handling
  Future<List<TvShowModel>> getList() async {
    try {
      final client = await db;
      final List<Map<String, dynamic>> data = await client.query(
        'bookmarked',
        orderBy: 'id DESC',
      );

      print('📦 Raw data from DB: $data');

      if (data.isEmpty) {
        print('⚠️ No bookmarks found');
        return [];
      }

      // ✅ Parse setiap row dengan null check
      List<TvShowModel> bookmarks = [];
      for (var row in data) {
        try {
          // ✅ Ambil data dengan null check
          final dataString = row['data']; // Support old schema

          if (dataString == null || dataString.toString().isEmpty) {
            print('⚠️ Empty data for row: $row');
            continue;
          }

          final jsonData = jsonDecode(dataString.toString());
          final tvShow = TvShowModel.fromJson(jsonData);
          bookmarks.add(tvShow);
        } catch (e, stackTrace) {
          print('❌ Error parsing row: $e');
          print('Stack trace: $stackTrace');
          print('Problematic row: $row');
        }
      }

      print('✅ Parsed ${bookmarks.length} bookmarks');
      return bookmarks;
    } catch (e, stackTrace) {
      print('❌ Error getting bookmarks: $e');
      print('Stack trace: $stackTrace');
      return [];
    }
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
