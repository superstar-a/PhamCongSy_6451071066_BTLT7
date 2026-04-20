import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../utils/constants.dart';

class UserController {
  Future<List<User>> fetchUsers() async {
    final res = await http.get(Uri.parse(ApiEndpoints.users));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users (${res.statusCode})');
    }
  }
}
