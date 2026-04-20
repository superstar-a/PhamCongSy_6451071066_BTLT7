import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../utils/constants.dart';

class SearchApiController {
  Future<List<Product>> search(String keyword) async {
    final res = await http.get(Uri.parse(ApiEndpoints.search(keyword)));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final List list = data['products'] ?? [];
      return list.map((e) => Product.fromJson(e)).toList();
    }
    throw Exception('Search failed: ${res.statusCode}');
  }
}
