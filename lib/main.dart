import 'package:estudo_sqlite/app/app.dart';
import 'package:estudo_sqlite/repositories/sqlite/sqlite_repository.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _sqliteRepository = SqliteRepository();
  final database = await _sqliteRepository.database();
  runApp(App());
}
