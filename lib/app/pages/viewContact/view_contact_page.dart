import 'package:estudo_sqlite/shared/models/contact.dart';
import 'package:flutter/material.dart';

class ViewContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact contact =
        ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${contact.name}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(contact.name),
            Text(contact.phone),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
