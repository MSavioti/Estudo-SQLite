import 'package:estudo_sqlite/services/sqlite_service.dart';
import 'package:estudo_sqlite/shared/models/contact.dart';
import 'package:flutter/material.dart';

class EditContactForm extends StatefulWidget {
  EditContactForm({Key? key, required this.contact}) : super(key: key);
  final Contact contact;

  @override
  _EditContactFormState createState() => _EditContactFormState();
}

class _EditContactFormState extends State<EditContactForm> {
  final SqliteService _sqliteService = SqliteService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateTextField(String? inputText) {
    if ((inputText == null) || (inputText.isEmpty)) {
      return 'This field can\'t be left blank';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Contact contact = widget.contact;
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: contact.name,
                  autofocus: true,
                  validator: _validateTextField,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Contact\'s name...',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        contact.name = newValue;
                      });
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  initialValue: contact.phone,
                  autofocus: true,
                  validator: _validateTextField,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Phone',
                    hintText: 'Phone number',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        contact.phone = newValue;
                      });
                    }
                  },
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _sqliteService.updateContact(contact);
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
                      child: Text('Update'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
