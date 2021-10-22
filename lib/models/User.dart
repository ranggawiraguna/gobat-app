import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String id, username, password, fullname, email;

  User(QueryDocumentSnapshot<Object?> element) {
    this.id = element.id;
    this.username = element["username"];
    this.password = element["password"];
    this.fullname = element["fullname"];
    this.email = element["email"];
  }
}
