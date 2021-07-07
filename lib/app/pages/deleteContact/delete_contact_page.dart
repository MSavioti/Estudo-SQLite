import 'package:estudo_sqlite/app/pages/deleteContact/widgets/deletion_confirmation.dart';
import 'package:estudo_sqlite/shared/models/contact.dart';
import 'package:flutter/material.dart';

class DeleteContactPage extends StatelessWidget {
  const DeleteContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Contact contact =
        ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delete contact \"${contact.name}\"',
        ),
      ),
      body: DeletionConfirmation(
        contact: contact,
      ),
    );
  }
}
