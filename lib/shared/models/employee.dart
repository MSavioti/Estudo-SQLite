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
      'id': id,
      'name': name,
      'age': age,
      'gender': gender.toString().split('.').last,
      'sector': sector,
    };
  }

  static Employee fromMap(Map<String, dynamic> employee) {
    return Employee(
      name: employee['name'],
      age: employee['age'],
      gender: SqliteService.genderFromString(employee['gender']),
      sector: employee['sector'],
    );
  }
}
