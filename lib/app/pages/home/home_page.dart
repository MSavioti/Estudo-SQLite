import 'package:estudo_sqlite/app/pages/home/widgets/contact_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite DEMO'),
      ),
      body: ContactListView(),
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/addContact');
        },
      ),
    );
  }
}
