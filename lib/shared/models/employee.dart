import 'package:estudo_sqlite/services/sqlite_service.dart';
import 'package:estudo_sqlite/shared/enums/gender.dart';

class Employee {
  int id = 0;
  String name = '';
  int age = 0;
  Gender gender = Gender.undisclosed;
  String sector = '';

  Employee({
    required this.name,
    required this.age,
    required this.gender,
    required this.sector,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender.toString().split('.').last,
      'sector': sector,
    };
  }

  static Employee fromMap(Map<String, dynamic> employeeMap) {
    Employee employee = Employee(
      name: employeeMap['name'],
      age: employeeMap['age'],
      gender: SqliteService.genderFromString(employeeMap['gender']),
      sector: employeeMap['sector'],
    );
    employee.id = employeeMap['id'];
    return employee;
  }

  @override
  String toString() {
    return 'Employee n° $id\nName: $name\nAge: $age\nGender: ${gender.toString().split('.').last}\nSector: $sector\n';
  }
}
