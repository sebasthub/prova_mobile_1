// product_model.dart
class Product {
  final int? id; // Adicionei ID para identificar produtos existentes
  final bool active;
  final String name;
  final int quantity;
  final double price;
  final String ncu;

  Product({
    this.id,
    required this.active,
    required this.name,
    required this.quantity,
    required this.price,
    required this.ncu,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      active: json['active'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      ncu: json['ncu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'name': name,
      'quantity': quantity,
      'price': price,
      'ncu': ncu,
      'user_id': 0,
    };
  }
}
