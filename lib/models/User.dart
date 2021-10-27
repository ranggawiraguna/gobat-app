class User {
  final String id, username, password, fullname, email;
  final Map<String, List<String>> favorites, views;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.fullname,
    required this.email,
    required this.favorites,
    required this.views,
  });

  static Map<String, dynamic> newUser({
    required String username,
    required String password,
    required String fullname,
    required String email,
  }) =>
      {
        "username": username,
        "password": password,
        "fullname": fullname,
        "email": email,
        "favorites": {"articles": [], "products": []},
        "views": {"articles": [], "products": []},
      };

  static get empty => User(
        id: "",
        username: "",
        password: "",
        fullname: "",
        email: "",
        favorites: {"articles": [], "products": []},
        views: {"articles": [], "products": []},
      );

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "username": this.username,
        "password": this.password,
        "fullname": this.fullname,
        "email": this.email,
        "favorites": this.favorites,
        "views": this.views,
      };
}
