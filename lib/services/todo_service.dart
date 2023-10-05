import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/config/config.dart';
import 'package:todo_app/models/add_todo.dart';
import 'package:todo_app/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  var client = http.Client();

  Future<List<Todo>> getTodos() async {
    var url = Uri.http(Config.apiUrl, Config.getTodos);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final todoList = todoFromJson(response.body);
      return todoList;
    } else {
      throw Exception("failed");
    }
  }

  Future<void> addTodo(TodoModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    final url = Uri.http(Config.apiUrl, Config.addTodo);

    final response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      debugPrint("body ${response.body}");
    }
  }
}
