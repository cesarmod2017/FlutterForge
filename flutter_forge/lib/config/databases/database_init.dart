import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_forge/config/databases/ILocalDb.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqfLiteHub {
  static Future<void> init() async {
    if (Platform.isWindows) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  }
}

Database? _database;

class LocalDb implements ILocalDb {
  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDb('flutter_forge.db');
    return _database;
  }

  Future _initializeDb(String filePath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    db.execute('''
              CREATE TABLE LocalData (id INTEGER PRIMARY KEY,
              KEY VARCHAR(150) NOT NULL,
              CODE VARCHAR(50) NULL,
              VALUE JSON NOT NULL)
              ''');
  }

  @override
  Future<void> clearDataBase() async {
    final db = await database;
    db.rawQuery('PRAGMA busy_timeout=120000');
    await db!.rawDelete('DELETE FROM LocalData ');
  }

  @override
  Future<void> deleteByKey({
    String? key,
    String? id,
  }) async {
    final db = await database;
    db.rawQuery('PRAGMA busy_timeout=120000');

    final whereClauses = <String>[];
    final whereArgs = <dynamic>[];

    if (key != null) {
      whereClauses.add('KEY = ?');
      whereArgs.add(key);
    }

    if (id != null) {
      whereClauses.add('CODE = ?');
      whereArgs.add(id);
    }

    if (whereClauses.isEmpty) {
      throw ArgumentError('Pelo menos um parâmetro deve ser fornecido.');
    }

    final whereStatement = whereClauses.join(' AND ');
    final sql = 'DELETE FROM LocalData WHERE $whereStatement';

    await db!.rawDelete(sql, whereArgs);
  }

  @override
  Future<void> addData({
    String? key,
    String? id,
    String? channelId,
    dynamic data,
    bool? clearCurrentData,
  }) async {
    final db = await database;
    db.rawQuery('PRAGMA busy_timeout=120000');

    if (clearCurrentData == true) {
      await deleteByKey(
        key: key,
        id: id,
      );
    }

    if (data is List) {
      await _batchInsert(db, key, id, data);
    } else {
      await _singleInsert(db, key, id, data);
    }
  }

  Future<void> _batchInsert(
      Database db, String? key, String? id, List data) async {
    final batch = db.batch();

    for (var element in data) {
      if (element is List) {
        for (var item in element) {
          _addInsertToBatch(batch, key, id, item);
        }
      } else {
        _addInsertToBatch(batch, key, id, element);
      }
    }

    await batch.commit(noResult: true);
  }

  void _addInsertToBatch(Batch batch, String? key, String? id, dynamic data) {
    final jsonData = jsonEncode(data);
    batch.insert('LocalData', {
      'KEY': key,
      'CODE': id,
      'VALUE': jsonData,
    });
  }

  Future<void> _singleInsert(
      Database db, String? key, String? id, dynamic data) async {
    final jsonData = jsonEncode(data);
    await db.insert('LocalData', {
      'KEY': key,
      'CODE': id,
      'VALUE': jsonData,
    });
  }

  @override
  Future<List<dynamic>> readAllByKey({
    String? key,
    String? id,
  }) async {
    final db = await database;
    db.rawQuery('PRAGMA busy_timeout=120000');

    final whereClauses = <String>[];
    final whereArgs = <dynamic>[];

    if (key != null) {
      whereClauses.add('KEY = ?');
      whereArgs.add(key);
    }

    if (id != null) {
      whereClauses.add('CODE = ?');
      whereArgs.add(id);
    }

    if (whereClauses.isEmpty) {
      throw ArgumentError('Pelo menos um parâmetro deve ser fornecido.');
    }

    final whereStatement = whereClauses.join(' AND ');
    final sql = 'SELECT * FROM LocalData WHERE $whereStatement';

    return await db!.rawQuery(sql, whereArgs);
  }

  @override
  Future<List<dynamic>> readAllData() async {
    final db = await database;
    db.rawQuery('PRAGMA busy_timeout=120000');
    final allData = await db!.query('LocalData');
    return allData;
  }

  @override
  Future<dynamic> getById<T>({int? id}) async {
    final db = await database;
    db.rawQuery('PRAGMA busy_timeout=120000');
    final allData =
        await db!.rawQuery('SELECT * FROM LocalData WHERE id = ?', [id]);
    return allData;
  }
}
