import 'package:estudo_sqlite/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
