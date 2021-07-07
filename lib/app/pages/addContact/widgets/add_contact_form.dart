import 'package:estudo_sqlite/services/sqlite_service.dart';
import 'package:estudo_sqlite/shared/models/contact.dart';
import 'package:flutter/material.dart';

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final SqliteService _sqliteService = SqliteService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _validateTextField(String? inputText) {
    if ((inputText == null) || (inputText.isEmpty)) {
      return 'This field can\'t be left blank';
    }

    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  autofocus: true,
                  validator: _validateTextField,
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Contact\'s name...',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  autofocus: true,
                  validator: _validateTextField,
                  controller: _phoneController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Phone',
                    hintText: 'Phone number',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, '/');
                          Contact contact = Contact(
                            name: _nameController.text,
                            phone: _phoneController.text,
                          );
                          _sqliteService.addContact(contact);
                        }
                      },
                      child: Text('Submit'),
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
