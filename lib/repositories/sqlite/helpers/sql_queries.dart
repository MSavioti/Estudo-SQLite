import 'package:estudo_sqlite/shared/models/employee.dart';

class SqlQueries {
  static const String createEmployeeTable =
      'CREATE TABLE employees(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, gender_id INTEGER, sector TEXT)';

  static const String employeesTableName = 'employees';
}
