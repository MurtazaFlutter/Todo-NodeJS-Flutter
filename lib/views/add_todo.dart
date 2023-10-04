import 'package:flutter/material.dart';
import 'package:todo_app/controllers/text_widget.dart';
import '../components/text_field.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add TODO"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTextField(
              hintText: 'Title',
              lines: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              hintText: 'Description',
              lines: 3,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const TextWidget(
                    title: "Submit", weight: FontWeight.w600, size: 20))
          ],
        ),
      ),
    );
  }
}
