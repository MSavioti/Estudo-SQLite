import 'package:estudo_sqlite/repositories/sqlite/helpers/sql_queries.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqlite;

class SqliteRepository {
  late sqlite.Database _database;
  bool _initializedDatabase = false;

  Future<sqlite.Database> database() async {
    try {
      if (!_initializedDatabase) {
        return await _openDatabase();
      }

      return _database;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addEmployee(Map<String, dynamic> employee) async {
    try {
      final sqlite.Database db = await database();
      await db.insert(
        SqlQueries.employeesTableName,
        employee,
        conflictAlgorithm: sqlite.ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateEmployee(Map<String, dynamic> employee) async {
    try {
      final sqlite.Database db = await database();
      await db.update(
        SqlQueries.employeesTableName,
        employee,
        where: 'id = ?',
        whereArgs: employee["id"],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeEmployee(int id) async {
    try {
      final sqlite.Database db = await database();
      await db.delete(
        SqlQueries.employeesTableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> listEmployees() async {
    print('listing employees');
    try {
      final sqlite.Database db = await database();
      print(db);
      final List<Map<String, dynamic>> queriesEmployees =
          await db.query(SqlQueries.employeesTableName);
      return queriesEmployees;
    } catch (e) {
      rethrow;
    }
  }

  Future<sqlite.Database> _openDatabase({int version = 1}) async {
    print('Opening database...');
    try {
      final databasePath =
          path.join(await sqlite.getDatabasesPath(), 'test_database.db');
      final sqlite.Database database = await sqlite.openDatabase(
        databasePath,
        version: version,
        onCreate: (db, version) async {
          return db.execute(SqlQueries.createEmployeeTable);
        },
      );
      _database = database;
      print('Opened database.');
      _initializedDatabase = true;
      return database;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> closeConnection() async {
    final sqlite.Database db = await database();
    if (db.isOpen) {
      db.close();
    }
  }
}
