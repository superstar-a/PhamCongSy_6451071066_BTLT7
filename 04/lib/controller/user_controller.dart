import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../utils/constants.dart';

class UserController {
  Future<User> fetchUser(int id) async {
    final res = await http.get(Uri.parse(ApiEndpoints.user(id)));
    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    }
    throw Exception('GET failed: ${res.statusCode}');
  }

  Future<User> updateUser(User user) async {
    final res = await http.put(
      Uri.parse(ApiEndpoints.user(user.id)),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(user.toJson()),
    );
    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    }
    throw Exception('PUT failed: ${res.statusCode}');
  }
}
