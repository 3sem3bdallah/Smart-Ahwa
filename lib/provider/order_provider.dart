import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_ahwa/model/order_model.dart';
import 'package:smart_ahwa/config/cash/cash_helper.dart';

class OrderNotifier extends StateNotifier<List<Order>> {
  OrderNotifier() : super([]) {
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    state = await CashHelper.loadOrders();
  }

  Future<void> addOrder(Order order) async {
    state = [...state, order];
    await CashHelper.saveOrders(state);
  }

  Future<void> completeOrder(int index) async {
    final updated = state[index].copyWith(completed: true);
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) updated else state[i],
    ];
    await CashHelper.saveOrders(state);
  }

  Future<void> clearOrders() async {
    state = [];
    await CashHelper.clearOrders();
  }
}

final ordersProvider = StateNotifierProvider<OrderNotifier, List<Order>>(
  (ref) => OrderNotifier(),
);
