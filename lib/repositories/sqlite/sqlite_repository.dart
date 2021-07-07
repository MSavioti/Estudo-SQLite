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

  Future<bool> addContact(Map<String, dynamic> contact) async {
    try {
      final sqlite.Database db = await database();
      await db.insert(
        SqlQueries.contactsTableName,
        contact,
        conflictAlgorithm: sqlite.ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateContact(Map<String, dynamic> contact) async {
    try {
      final sqlite.Database db = await database();
      await db.update(
        SqlQueries.contactsTableName,
        contact,
        where: 'id = ?',
        whereArgs: contact["id"],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeContact(int id) async {
    try {
      final sqlite.Database db = await database();
      await db.delete(
        SqlQueries.contactsTableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> listContacts() async {
    try {
      final sqlite.Database db = await database();
      final List<Map<String, dynamic>> queriesContacts =
          await db.query(SqlQueries.contactsTableName);
      return queriesContacts;
    } catch (e) {
      rethrow;
    }
  }

  Future<sqlite.Database> _openDatabase({int version = 1}) async {
    try {
      final databasePath =
          path.join(await sqlite.getDatabasesPath(), 'contact_database.db');
      final sqlite.Database database = await sqlite.openDatabase(
        databasePath,
        version: version,
        onCreate: (db, version) async {
          return db.execute(SqlQueries.createContactsTable);
        },
      );
      _database = database;
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
