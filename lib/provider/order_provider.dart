import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_ahwa/model/order_model.dart';

class OrderNotifier extends StateNotifier<List<Order>> {
  OrderNotifier() : super([]);

  void addOrder(Order order) {
    state = [...state, order];
  }

  void completeOrder(int index) {
    final updated = state[index].copyWith(completed: true);
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) updated else state[i],
    ];
  }
}

final ordersProvider = StateNotifierProvider<OrderNotifier, List<Order>>(
  (ref) => OrderNotifier(),
);
