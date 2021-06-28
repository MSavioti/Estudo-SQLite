import 'package:estudo_sqlite/repositories/sqlite/sqlite_repository.dart';
import 'package:estudo_sqlite/shared/enums/sex.dart';
import 'package:estudo_sqlite/shared/models/employee.dart';

class SqliteService {
  late SqliteRepository _repository;

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

  //TODO: make it right
  static Sex idToSex(int id) {
    return Sex.private;
  }

  //TODO: make it right
  static int sexToId(Sex sex) {
    return 0;
  }
}
