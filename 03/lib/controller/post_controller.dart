import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../utils/constants.dart';

class PostController {
  Future<Post> createPost(Post post) async {
    final res = await http.post(
      Uri.parse(ApiEndpoints.posts),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(post.toJson()),
    );
    if (res.statusCode == 201 || res.statusCode == 200) {
      return Post.fromJson(jsonDecode(res.body));
    }
    throw Exception('Failed to create post (${res.statusCode})');
  }
}
