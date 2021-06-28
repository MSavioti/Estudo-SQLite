import 'package:estudo_sqlite/services/sqlite_service.dart';
import 'package:estudo_sqlite/shared/enums/e_sex.dart';

class Employee {
  int id = 0;
  String name = '';
  int age = 0;
  ESex sex = ESex.private;
  String sector = '';

  Employee({
    required this.name,
    required this.age,
    required this.sex,
    required this.sector,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'sex': SqliteService.sexToId(sex),
      'sector': sector,
    };
  }

  static Employee fromMap(Map<String, dynamic> employee) {
    return Employee(
      name: employee['name'],
      age: employee['age'],
      sex: SqliteService.idToSex(employee['sex']),
      sector: employee['sector'],
    );
  }
}
