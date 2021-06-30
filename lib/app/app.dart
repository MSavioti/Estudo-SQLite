import 'package:estudo_sqlite/app/pages/addEmployee/add_employee_page.dart';
import 'package:estudo_sqlite/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigo[100],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/addEmployee': (context) => AddEmployeePage(),
      },
    );
  }
}
