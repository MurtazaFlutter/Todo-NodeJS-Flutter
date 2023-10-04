import 'package:flutter/material.dart';
import 'package:todo_app/controllers/text_widget.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/views/add_todo.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoScreen()));
        },
        label: const TextWidget(
            title: "Add TODO", weight: FontWeight.w600, size: 15),
      ),
      appBar: AppBar(
        title: const Text("TODO List"),
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
                  child: TextWidget(
                      title: "Failed to show Data",
                      weight: FontWeight.bold,
                      size: 20));
            } else if (snapshot.data!.isEmpty && snapshot.data == null) {
              return const Center(
                  child: TextWidget(
                      title: "Nothing to show",
                      weight: FontWeight.bold,
                      size: 20));
            } else {
              final data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    final todoData = data[index];
                    return ListTile(
                        title: TextWidget(
                            title: todoData.title,
                            weight: FontWeight.w600,
                            size: 20),
                        leading: CircleAvatar(
                          child: Text(data.length.toString()),
                        ),
                        subtitle: TextWidget(
                            title: todoData.description,
                            weight: FontWeight.w400,
                            size: 12));
                  }));
            }
          }),
    );
  }
}
