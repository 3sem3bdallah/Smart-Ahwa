import 'package:flutter/material.dart';

class NotesField extends StatelessWidget {
  final TextEditingController controller;
  const NotesField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Special Instructions (optional)',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      maxLines: 2,
    );
  }
}
