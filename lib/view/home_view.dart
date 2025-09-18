import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa/provider/order_provider.dart';
import 'package:smart_ahwa/view/order_view.dart';
import 'package:smart_ahwa/widget/orders_list_widget.dart';
import 'package:smart_ahwa/widget/bottom_nav_bar.dart';
import 'package:smart_ahwa/widget/empty_orders_widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'), centerTitle: true),
      body: orders.isEmpty
          ? const EmptyOrdersWidget()
          : OrdersListWidget(orders: orders),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Order',
        backgroundColor: const Color.fromARGB(255, 139, 98, 59),
        child: Icon(Icons.add, size: 30.sp, color: Colors.white),
        onPressed: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OrderView()),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
