import 'package:estudo_sqlite/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'employee_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE employees(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, sex_id INTEGER, sector TEXT)');
    },
    version: 1,
  );
  runApp(App());
}
