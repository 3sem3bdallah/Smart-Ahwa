import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa/provider/order_provider.dart';

class OrdersListWidget extends ConsumerWidget {
  final List orders;
  const OrdersListWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('${order.customer} - ${order.drink}'),
              subtitle: Text('Notes: ${order.notes}'),
              trailing: order.completed
                  ? const Icon(Icons.check, color: Colors.green)
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () => ref
                          .read(ordersProvider.notifier)
                          .completeOrder(index),
                      child: const Text('Completed'),
                    ),
            ),
          );
        },
      ),
    );
  }
}
