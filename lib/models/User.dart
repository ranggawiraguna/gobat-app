class User {
  final String id, username, password, fullname, email;

  User(
      {required this.id,
      required this.username,
      required this.password,
      required this.fullname,
      required this.email});

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "username": this.username,
        "password": this.password,
        "fullname": this.fullname,
        "email": this.email,
      };
}
