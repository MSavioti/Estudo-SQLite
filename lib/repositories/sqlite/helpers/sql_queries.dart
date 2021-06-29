class SqlQueries {
  static const String createEmployeeTable =
      'CREATE TABLE employees(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, sex_id INTEGER, sector TEXT)';

  static const String createSexTable =
      'CREATE TABLE genders(id INTEGER PRIMARY KEY, gender TEXT)';

  static const String employeesTableName = 'employees';
}
