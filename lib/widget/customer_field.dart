import 'package:flutter/material.dart';

class CustomerField extends StatelessWidget {
  final TextEditingController controller;
  const CustomerField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Customer Name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      validator: (value) =>
          value == null || value.isEmpty ? 'Please enter a customer name' : null,
    );
  }
}
