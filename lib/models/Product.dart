class Product {
  final String id, name, description;

  Product({
    required this.id,
    required this.name,
    required this.description,
  });

  static get empty => Product(id: "", name: "", description: "");

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "name": this.name,
        "description": this.description,
      };
}
