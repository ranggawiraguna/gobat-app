class Article {
  final String id;
  final Map<String, int> counter;
  final Map<String, dynamic> information;

  Article({
    required this.id,
    required this.counter,
    required this.information,
  });

  static get empty => Article(
        id: "",
        counter: {"favorite": 0, "view": 0},
        information: {
          "title": "",
          "description": "",
          "image": "",
          "date_post": "",
        },
      );

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "counter": this.counter,
        "information": this.information,
      };
}
