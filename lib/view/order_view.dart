import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa/model/order_model.dart';
import 'package:smart_ahwa/provider/order_provider.dart';
import 'package:smart_ahwa/widget/customer_field.dart';
import 'package:smart_ahwa/widget/drink_dropdown.dart';
import 'package:smart_ahwa/widget/notes_field.dart';

class OrderView extends ConsumerStatefulWidget {
  const OrderView({super.key});

  @override
  ConsumerState<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends ConsumerState<OrderView> {
  final _formKey = GlobalKey<FormState>();
  final _customerController = TextEditingController();
  final _notesController = TextEditingController();
  String _drinkType = 'Tea';

  final List<String> _drinkOptions = [
    'Tea',
    'Coffee',
    'Sahlab',
    'Hibiscus',
    'Cappuccino',
    'Turkish Coffee',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Order'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomerField(controller: _customerController),
              SizedBox(height: 16.h),
              DrinkDropdown(
                value: _drinkType,
                options: _drinkOptions,
                onChanged: (val) => setState(() => _drinkType = val),
              ),
              SizedBox(height: 16.h),
              NotesField(controller: _notesController),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(ordersProvider.notifier)
                        .addOrder(
                          Order(
                            customer: _customerController.text,
                            drink: _drinkType,
                            notes: _notesController.text,
                          ),
                        );
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
