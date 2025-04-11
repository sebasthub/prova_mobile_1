class Product {
  final int? id;
  final bool active;
  final String name;
  final int quantity;
  final double price;

  Product({
    this.id,
    required this.active,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      active: json['active'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'name': name,
      'quantity': quantity,
      'price': price,
      'user_id': 0,
    };
  }
}
