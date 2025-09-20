import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_ahwa/model/order_model.dart';

class CashHelper {
   static const String _key = "orders";

  static Future<void> saveOrders(List<Order> orders) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = orders.map((o) => jsonEncode(o.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  static Future<List<Order>> loadOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];
    return jsonList.map((j) => Order.fromJson(jsonDecode(j))).toList();
  }

  static Future<void> clearOrders() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  static Future<void> init() async {}
}