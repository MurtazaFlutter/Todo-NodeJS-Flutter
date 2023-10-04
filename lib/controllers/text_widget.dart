import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final FontWeight weight;
  final double size;

  const TextWidget(
      {super.key,
      required this.title,
      required this.weight,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(fontSize: size, fontWeight: weight),
    );
  }
}
