import 'package:estudo_sqlite/app/pages/editContact/widgets/edit_contact_form.dart';
import 'package:estudo_sqlite/shared/models/contact.dart';
import 'package:flutter/material.dart';

class EditContactPage extends StatefulWidget {
  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  @override
  Widget build(BuildContext context) {
    final Contact contact =
        ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit contact \"${contact.name}\"',
        ),
      ),
      body: EditContactForm(
        contact: contact,
      ),
    );
  }
}
