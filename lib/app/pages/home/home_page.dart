import 'package:estudo_sqlite/app/pages/home/widgets/employee_list_view.dart';
import 'package:estudo_sqlite/services/sqlite_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final SqliteService _sqliteService = SqliteService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite DEMO'),
      ),
      backgroundColor: Colors.indigo[100],
      body: EmployeeListView(),
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          _sqliteService.teste();
        },
      ),
    );
  }
}
