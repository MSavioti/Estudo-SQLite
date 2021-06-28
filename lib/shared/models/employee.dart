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
}
