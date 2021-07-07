import 'package:estudo_sqlite/repositories/sqlite/sqlite_repository.dart';
import 'package:estudo_sqlite/shared/models/contact.dart';

class SqliteService {
  late SqliteRepository _repository;

  SqliteService() {
    _repository = SqliteRepository();
  }

  Future<bool> addContact(Contact contact) async {
    return await _repository.addContact(contact.toMap());
  }

  Future<bool> updateContact(Contact contact) async {
    return await _repository.updateContact(contact.toMap());
  }

  Future<bool> removeContact(Contact contact) async {
    return await _repository.removeContact(contact.id);
  }

  Future<Contact> findContact(int id) async {
    final List<Contact> contacts = await listContacts();
    return contacts.where((contact) => contact.id == id).first;
  }

  Future<List<Contact>> listContacts() async {
    final queriesContacts = await _repository.listContacts();

    if (queriesContacts.isEmpty) {
      return [];
    }

    return List.generate(queriesContacts.length, (i) {
      return Contact.fromMap(queriesContacts[i]);
    });
  }
}
