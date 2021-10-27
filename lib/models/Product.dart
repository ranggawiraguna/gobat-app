class Product {
  final String id;
  final Map<String, int> counter;
  final Map<String, dynamic> information;

  Product({
    required this.id,
    required this.counter,
    required this.information,
  });

  static get empty => Product(
        id: "",
        counter: {"favorite": 0, "view": 0},
        information: {
          "composition": "",
          "description": "",
          "dose": "",
          "images": [],
          "indication": "",
          "instant_product": {},
          "labels": [],
          "name": "",
          "usage_rules": "",
        },
      );

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "counter": this.counter,
        "information": this.information,
      };
}
