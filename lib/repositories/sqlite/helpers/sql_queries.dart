class SqlQueries {
  static const String createContactsTable =
      'CREATE TABLE $contactsTableName(id INTEGER PRIMARY KEY, name TEXT, phone TEXT)';

  static const String contactsTableName = 'contact';
}
