import 'package:estudo_sqlite/services/sqlite_service.dart';

enum Gender { masculine, feminine, nonBinary, undisclosed }

enum Level { trainee, junior, middle, senior }

class Employee {
  int id = 0;
  String name = '';
  int age = 0;
  Gender gender = Gender.undisclosed;
  String sector = '';
  Level level = Level.trainee;

  Employee({
    required this.name,
    required this.age,
    required this.gender,
    required this.sector,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender.toString().split('.').last,
      'sector': sector,
      'level': level.toString().split('.').last,
    };
  }

  static Employee fromMap(Map<String, dynamic> employeeMap) {
    Employee employee = Employee(
      name: employeeMap['name'],
      age: employeeMap['age'],
      gender: SqliteService.genderFromString(employeeMap['gender']),
      sector: employeeMap['sector'],
      level: SqliteService.levelFromString(employeeMap['level']),
    );
    employee.id = employeeMap['id'];
    return employee;
  }

  @override
  String toString() {
    return '\nEmployee n° $id\nName: $name\nAge: $age\nGender: ${gender.toString().split('.').last}\nSector: $sector\nLevel: ${level.toString().split('.').last}\n';
  }
}
