class Beverage {
  final int? id;
  final String name;
  final String description;
  final double price;

  Beverage({
    required this.name,
    required this.description,
    required this.price,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
