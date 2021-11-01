class Product {
  final String id, category;
  final Map<String, int> counter;
  final Map<String, dynamic> information;

  Product({
    required this.id,
    required this.category,
    required this.counter,
    required this.information,
  });

  static get empty => Product(
        id: "",
        category: "",
        counter: {"favorites": 0, "views": 0},
        information: {
          "composition": "",
          "description": "",
          "dose": "",
          "images": [],
          "indication": "",
          "name": "",
          "usage_rules": "",
        },
      );

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "category": "",
        "counter": this.counter,
        "information": this.information,
      };
}
