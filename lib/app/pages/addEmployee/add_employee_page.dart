import 'package:estudo_sqlite/app/pages/addEmployee/widgets/employee_form.dart';
import 'package:flutter/material.dart';

class AddEmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add Employee',
        ),
      ),
      body: Center(
        child: EmployeeForm(),
      ),
    );
  }
}
