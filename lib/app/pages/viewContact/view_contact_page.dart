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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/deleteContact',
                  arguments: contact,
                );
              },
              icon: Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 400.0,
              height: 200.0,
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
                        contact.name,
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Phone: ${contact.phone}',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/editContact',
            arguments: contact,
          );
        },
        child: Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
