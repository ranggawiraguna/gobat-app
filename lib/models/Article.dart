class Article {
  final String id, title, description;

  Article({
    required this.id,
    required this.title,
    required this.description,
  });

  static get empty => Article(id: "", title: "", description: "");

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "title": this.title,
        "description": this.description,
      };
}
