import 'package:estudo_sqlite/services/sqlite_service.dart';
import 'package:estudo_sqlite/shared/models/contact.dart';
import 'package:flutter/material.dart';

class DeletionConfirmation extends StatelessWidget {
  DeletionConfirmation({Key? key, required this.contact}) : super(key: key);

  final Contact contact;
  final SqliteService _sqliteService = SqliteService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 400.0,
            height: 400.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Confirm deletion of this contact?',
                      style: TextStyle(
                        fontSize: 26.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      contact.name,
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Phone: ${contact.phone}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 48.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text(
                            'YES',
                            style:
                                TextStyle(color: Colors.green, fontSize: 28.0),
                          ),
                          onPressed: () async {
                            await _sqliteService.removeContact(contact);
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            Navigator.pushReplacementNamed(context, '/');
                          },
                        ),
                        TextButton(
                          child: Text(
                            'NO',
                            style: TextStyle(color: Colors.red, fontSize: 28.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
