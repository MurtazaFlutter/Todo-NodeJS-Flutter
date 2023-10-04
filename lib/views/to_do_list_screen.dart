import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_service.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late Future<List<Todo>> _todos;
  @override
  void initState() {
    super.initState();
    _todos = TodoService().getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do app"),
      ),
      body: FutureBuilder<List<Todo>>(
          future: _todos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Failed to show Data"),
              );
            } else if (snapshot.data!.isEmpty && snapshot.data == null) {
              return const Center(
                child: Text("empty"),
              );
            } else {
              final data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    final todoData = data[index];
                    return ListTile(
                      title: Text(
                        todoData.title,
                      ),
                      leading: CircleAvatar(
                        child: Text(data[index].toString()),
                      ),
                      subtitle: Text(todoData.description),
                    );
                  }));
            }
          }),
    );
  }
}
