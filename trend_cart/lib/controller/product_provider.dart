import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:trend_cart/model/products.dart';

Future<List<Products>> fetchAllProducts() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Products.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
Future<List<String>> fetchCategories() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));

  if (response.statusCode == 200) {
    return List<String>.from(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load categories');
  }
}

Future<List<Products>> fetchProductByCategory(String category) async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$category'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Products.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products for category: $category');
  }
}