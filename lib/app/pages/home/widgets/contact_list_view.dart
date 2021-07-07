import 'package:estudo_sqlite/services/sqlite_service.dart';
import 'package:estudo_sqlite/shared/models/contact.dart';
import 'package:flutter/material.dart';

class ContactListView extends StatefulWidget {
  @override
  _ContactListViewState createState() => _ContactListViewState();
}

class _ContactListViewState extends State<ContactListView> {
  final SqliteService _sqliteService = SqliteService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
      future: _sqliteService.listContacts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final contacts = snapshot.data;

        return ListView.builder(
          itemCount: contacts!.length,
          shrinkWrap: true,
          itemBuilder: (_, i) {
            return Card(
              child: ListTile(
                title: Text(contacts[i].name),
                subtitle: Text(contacts[i].phone),
              ),
            );
          },
        );
      },
    );
  }
}
