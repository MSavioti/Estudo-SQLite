import 'package:estudo_sqlite/app/pages/addContact/add_contact_page.dart';
import 'package:estudo_sqlite/app/pages/editContact/edit_contact_page.dart';
import 'package:estudo_sqlite/app/pages/home/home_page.dart';
import 'package:estudo_sqlite/app/pages/viewContact/view_contact_page.dart';
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
        '/addContact': (context) => AddContactPage(),
        '/viewContact': (context) => ViewContactPage(),
        '/editContact': (context) => EditContactPage(),
      },
    );
  }
}
