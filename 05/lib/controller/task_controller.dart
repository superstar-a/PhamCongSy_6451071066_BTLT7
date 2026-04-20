import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';
import '../utils/constants.dart';

class TaskController {
  Future<List<Task>> fetchTasks({int limit = 15}) async {
    final res = await http.get(Uri.parse('${ApiEndpoints.todos}?_limit=$limit'));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Task.fromJson(e)).toList();
    }
    throw Exception('GET failed: ${res.statusCode}');
  }

  Future<bool> deleteTask(int id) async {
    final res = await http.delete(Uri.parse(ApiEndpoints.todo(id)));
    return res.statusCode == 200;
  }
}
