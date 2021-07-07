class Contact {
  int id = 0;
  String name = '';
  String phone = '';

  Contact({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  static Contact fromMap(Map<String, dynamic> contactMap) {
    Contact contact = Contact(
      name: contactMap['name'],
      phone: contactMap['phone'],
    );
    contact.id = contactMap['id'];
    return contact;
  }

  @override
  String toString() {
    return '\nContact n° $id\nName: $name\Phone: $phone\n';
  }
}
