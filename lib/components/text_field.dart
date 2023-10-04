import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int lines;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      decoration: InputDecoration(
          hintText: hintText, border: const OutlineInputBorder()),
    );
  }
}
