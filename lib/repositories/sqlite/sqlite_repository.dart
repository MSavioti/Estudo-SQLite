import 'package:estudo_sqlite/repositories/sqlite/helpers/sql_queries.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqlite;

class SqliteRepository {
  late sqlite.Database _database;
  bool isDatabaseOpen = false;

  Future<sqlite.Database> database() async {
    try {
      if (isDatabaseOpen) {
        return _database;
      }

      return await _openDatabase();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addEmployee(Map<String, dynamic> employee,
      {sqlite.ConflictAlgorithm conflictAlgorithm =
          sqlite.ConflictAlgorithm.abort}) async {
    try {
      final db = await database();
      await db.insert(
        SqlQueries.employeesTableName,
        employee,
        conflictAlgorithm: conflictAlgorithm,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateEmployee(Map<String, dynamic> employee) async {
    try {
      return await addEmployee(employee,
          conflictAlgorithm: sqlite.ConflictAlgorithm.replace);
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeEmployee(int id) async {
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> findEmployee(int id) async {
    throw UnimplementedError();
  }

  Future<List<Map<String, dynamic>>> listEmployees() async {
    try {
      final db = await database();
      final List<Map<String, dynamic>> queriesEmployees =
          await db.query(SqlQueries.employeesTableName);
      return queriesEmployees;
    } catch (e) {
      rethrow;
    }
  }

  Future<sqlite.Database> _openDatabase({int version = 1}) async {
    try {
      final database = await sqlite.openDatabase(
        path.join(await sqlite.getDatabasesPath(), 'employee_database.db'),
        version: version,
        onCreate: (db, version) {
          return db.execute(SqlQueries.createEmployeeTable);
        },
      );
      isDatabaseOpen = true;
      return database;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _closeConnection() {
    throw UnimplementedError();
  }
}
