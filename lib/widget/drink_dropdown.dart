import 'package:flutter/material.dart';

class DrinkDropdown extends StatelessWidget {
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const DrinkDropdown({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: options
          .map((drink) => DropdownMenuItem(value: drink, child: Text(drink)))
          .toList(),
      onChanged: (val) => onChanged(val!),
      decoration: InputDecoration(
        labelText: 'Drink Type',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }
}
