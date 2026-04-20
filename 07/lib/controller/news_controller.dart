import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/news.dart';
import '../utils/constants.dart';

class NewsController {
  final _rand = Random();

  Future<List<News>> fetchNews() async {
    final start = _rand.nextInt(90) + 1;
    final res = await http
        .get(Uri.parse('${ApiEndpoints.posts}?_start=$start&_limit=10'));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => News.fromJson(e)).toList();
    }
    throw Exception('Failed: ${res.statusCode}');
  }
}
