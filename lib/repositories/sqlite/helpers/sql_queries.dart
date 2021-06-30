class SqlQueries {
  static const String createEmployeeTable =
      'CREATE TABLE $employeesTableName(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, gender TEXT, sector TEXT, level TEXT, outsourced INTEGER)';

  static const String employeesTableName = 'employees';
}
