import 'dart:convert';

class Order {
  final String customer;
  final String drink;
  final String notes;
  final bool completed;

  Order({
    required this.customer,
    required this.drink,
    required this.notes,
    this.completed = false,
  });

  Order copyWith({bool? completed}) {
    return Order(
      customer: customer,
      drink: drink,
      notes: notes,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer': customer,
      'drink': drink,
      'notes': notes,
      'completed': completed,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      customer: json['customer'],
      drink: json['drink'],
      notes: json['notes'],
      completed: json['completed'],
    );
  }
}
