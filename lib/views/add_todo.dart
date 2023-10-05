import 'package:flutter/material.dart';
import 'package:todo_app/controllers/text_widget.dart';
import 'package:todo_app/models/add_todo.dart';
import 'package:todo_app/services/todo_service.dart';
import '../components/text_field.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titeController;
    _descriptionController;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    void validateForm() {
      if (formKey.currentState!.validate()) {
        final TodoModel model = TodoModel(
            title: _titeController.text,
            description: _descriptionController.text,
            isCompleted: false);
        TodoService().addTodo(model);
      } else {
        print("error");
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Add TODO")),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                hintText: 'Title',
                lines: 1,
                controller: _titeController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Description',
                lines: 3,
                controller: _descriptionController,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () => validateForm(),
                  child: const TextWidget(
                      title: "Submit", weight: FontWeight.w600, size: 20))
            ],
          ),
        ),
      ),
    );
  }
}
