import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class TodoApi {
  static const String baseUrl = 'https://api.nstack.in/v1/todos';

  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(
      Uri.parse(baseUrl),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> items = responseData['items'];
      return items.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch todos');
    }
  }

  Future<Todo> createTodo(Todo todo) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode({
        'title': todo.title,
        'description': todo.description,
        'is_completed': todo.isCompleted,
      }),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return Todo.fromJson(responseData['data']);
    } else {
      throw Exception('Failed to create todo');
    }
  }

  Future<Todo> updateTodo(Todo todo) async {
    final apiUrl = '$baseUrl/${todo.id}';

    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': todo.title,
        'description': todo.description,
        'is_completed': todo.isCompleted,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return Todo.fromJson(responseData['data']);
    } else {
      throw Exception('Failed to update todo');
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    final apiUrl = '$baseUrl/${todo.id}';

    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: {'accept': 'application/json'},
    );

    if (response.statusCode == 204) {
      return;
    } else if (response.statusCode == 404) {
    } else {
      throw Exception('Failed to delete todo');
    }
  }
}
