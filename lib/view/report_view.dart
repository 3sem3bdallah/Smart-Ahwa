import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_ahwa/provider/order_provider.dart';
import 'package:smart_ahwa/widget/bottom_nav_bar.dart';

class ReportView extends ConsumerWidget {
  const ReportView({super.key, required List orders});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);

    final int totalOrders = orders.length;
    final int completedOrders = orders.where((o) => o.completed).length;
    final int pendingOrders = totalOrders - completedOrders;

    final Map<String, int> drinkCount = {};
    for (var order in orders) {
      drinkCount[order.drink] = (drinkCount[order.drink] ?? 0) + 1;
    }
    final String mostPopularDrink = drinkCount.isNotEmpty
        ? drinkCount.entries.reduce((a, b) => a.value > b.value ? a : b).key
        : 'None';

    return Scaffold(
      appBar: AppBar(title: Text('Report'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildReportItem('Total Orders', totalOrders.toString()),
                _buildReportItem(
                  'Completed Orders',
                  completedOrders.toString(),
                ),
                _buildReportItem('Pending Orders', pendingOrders.toString()),
                _buildReportItem('Most Popular Drink', mostPopularDrink),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildReportItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(value),
        ],
      ),
    );
  }
}
