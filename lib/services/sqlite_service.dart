import 'package:estudo_sqlite/repositories/sqlite/sqlite_repository.dart';
import 'package:estudo_sqlite/shared/models/employee.dart';

class SqliteService {
  late SqliteRepository _repository;

  SqliteService() {
    _repository = SqliteRepository();
  }

  Future<bool> addEmployee(Employee employee) async {
    return await _repository.addEmployee(employee.toMap());
  }

  Future<bool> updateEmployee(Employee employee) async {
    return await _repository.updateEmployee(employee.toMap());
  }

  Future<bool> removeEmployee(Employee employee) async {
    return await _repository.removeEmployee(employee.id);
  }

  Future<Employee> findEmployee(int id) async {
    final List<Employee> employees = await listEmployees();
    return employees.where((employee) => employee.id == id).first;
  }

  Future<List<Employee>> listEmployees() async {
    final queriesEmployees = await _repository.listEmployees();

    return List.generate(queriesEmployees.length, (i) {
      return Employee.fromMap(queriesEmployees[i]);
    });
  }

  static Gender genderFromString(String genderName) {
    for (var gender in Gender.values) {
      if (gender.toString().contains(genderName)) {
        return gender;
      }
    }
    throw ArgumentError();
  }

  static Level levelFromString(String levelName) {
    for (var level in Level.values) {
      if (level.toString().contains(levelName)) {
        return level;
      }
    }
    throw ArgumentError();
  }
}
