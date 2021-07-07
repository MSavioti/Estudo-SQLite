import 'package:estudo_sqlite/shared/models/contact.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.phone),
        onTap: () {
          Navigator.pushNamed(context, '/viewContact', arguments: contact);
        },
      ),
    );
  }
}
