import 'package:estudo_sqlite/services/sqlite_service.dart';
import 'package:estudo_sqlite/shared/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeListView extends StatefulWidget {
  @override
  _EmployeeListViewState createState() => _EmployeeListViewState();
}

class _EmployeeListViewState extends State<EmployeeListView> {
  final SqliteService _sqliteService = SqliteService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Employee>>(
      future: _sqliteService.listEmployees(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final employees = snapshot.data;

        return SingleChildScrollView(
          child: ListView.builder(
            itemCount: employees!.length,
            shrinkWrap: true,
            itemBuilder: (_, i) {
              return Card(
                child: ListTile(
                  title: Text(employees[i].name),
                  subtitle: Text(employees[i].sector),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
