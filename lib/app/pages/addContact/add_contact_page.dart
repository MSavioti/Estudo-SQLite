import 'package:estudo_sqlite/app/pages/addContact/widgets/add_contact_form.dart';
import 'package:flutter/material.dart';

class AddContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add Contact',
        ),
      ),
      body: Center(
        child: AddContactForm(),
      ),
    );
  }
}
