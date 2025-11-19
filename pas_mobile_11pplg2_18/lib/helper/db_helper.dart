import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pas_mobile_11pplg2_18/models/tvshowmodel.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, tvshow_id INTEGER UNIQUE, name TEXT, image TEXT, data TEXT)',
        );
      },
    );
  }

  Future<int> insertFavorite(Tvshowmodel tvshow) async {
    final client = await db;
    final map = {
      'tvshow_id': tvshow.id,
      'name': tvshow.name,
      'image': tvshow.image,
      'data': jsonEncode(tvshow.toJson()),
    };
    return client.insert(
      'favorites',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteFavorite(int tvshowId) async {
    final client = await db;
    return client.delete(
      'favorites',
      where: 'tvshow_id = ?',
      whereArgs: [tvshowId],
    );
  }

  Future<Map<String, dynamic>?> getFavoriteRowByProductId(int tvshow_id) async {
    final client = await db;
    final rows = await client.query(
      'favorites',
      where: 'tvshow_id = ?',
      whereArgs: [tvshow_id],
      limit: 1,
    );
    if (rows.isNotEmpty) return rows.first;
    return null;
  }

  Future<List<Tvshowmodel>> getFavorites() async {
    final client = await db;
    final rows = await client.query('favorites', orderBy: 'id DESC');
    return rows.map((r) {
      final data = r['data'] as String?;
      if (data != null && data.isNotEmpty) {
         Tvshowmodel.fromJson(jsonDecode(data));
      }

      return Tvshowmodel(
        id: (r['tvshow_id'] as num).toInt(),
        name: r['name'] as String? ?? '',
        image: Image.fromJson(jsonDecode(r['image'] as String)),
        url: r['url'] as String? ?? '',
        type: Type.SCRIPTED,
        language: languageValues.map['English']!,
        rating: Rating(average: 0.0),
       
      );
    }).toList();
  }
}
