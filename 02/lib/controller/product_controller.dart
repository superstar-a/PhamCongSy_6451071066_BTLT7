import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../utils/constants.dart';

class ProductController {
  Future<Product> fetchProduct(int id) async {
    final res = await http.get(Uri.parse(ApiEndpoints.product(id)));
    if (res.statusCode == 200) {
      return Product.fromJson(jsonDecode(res.body));
    }
    throw Exception('Failed: ${res.statusCode}');
  }
}
