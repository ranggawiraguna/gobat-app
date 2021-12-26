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
        counter: {"favorites": 0, "views": 0},
        information: {
          "title": "",
          "description": "",
          "banner": "",
          "image": "",
          "date_post": "",
          "created_by": "",
        },
      );

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "counter": this.counter,
        "information": this.information,
      };
}
