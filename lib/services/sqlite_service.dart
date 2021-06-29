import 'package:estudo_sqlite/repositories/sqlite/sqlite_repository.dart';
import 'package:estudo_sqlite/shared/enums/gender.dart';
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

  void teste() async {
    var employee = Employee(
      name: 'José Rubinato',
      age: 19,
      gender: Gender.masculine,
      sector: 'Marketing',
    );
    addEmployee(employee);
    employee.name = 'Adoniran Barbosa';
    employee.age = 55;
    employee.gender = Gender.undisclosed;
    employee.sector = 'Sambista';
    addEmployee(employee);
    // final employees = await listEmployees();
    // employees.forEach(print);
  }

  static Gender genderFromString(String string) {
    switch (string) {
      case 'masculine':
        return Gender.masculine;
      case 'feminine':
        return Gender.feminine;
      case 'nonBinary':
        return Gender.nonBinary;
      case 'undisclosed':
        return Gender.undisclosed;
      default:
        throw ArgumentError();
    }
  }
}
