import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:prova_mobile_1/auth_service.dart';
import 'package:prova_mobile_1/models/product_model.dart';

class ProductService {
  static const String baseUrl =
      'http://172.16.111.182:8000';

  static Future<List<Product>> getProducts() async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    }
    throw Exception('Erro ao carregar produtos');
  }

  static Future<Product> createProduct(Product product) async {
    final token = await AuthService.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/products/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    }
    throw Exception('Erro ao criar produto');
  }

  static Future<Product> updateProduct(int id, Product product) async {
    final token = await AuthService.getToken();
    final response = await http.put(
      Uri.parse('$baseUrl/products/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    }
    throw Exception('Erro ao atualizar produto');
  }

  static Future<void> deleteProduct(int id) async {
    final token = await AuthService.getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/products/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar produto');
    }
  }
}
