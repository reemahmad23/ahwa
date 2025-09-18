import 'package:smart_ahwa_manager/features/ahwa_manager/domain/models/order_model.dart';
import 'package:smart_ahwa_manager/features/ahwa_manager/domain/repo/order_repo.dart';

class InMemoryOrderRepository implements OrderRepository {
  final List<OrderModel> _orders = [];

  @override
  Future<void> addOrder(OrderModel order) async {
    _orders.add(order);
    // simulate small delay
    await Future.delayed(const Duration(milliseconds: 50));
  }

  @override
  Future<List<OrderModel>> getAllOrders() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return List.unmodifiable(_orders);
  }

  @override
  Future<List<OrderModel>> getPendingOrders() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return List.unmodifiable(_orders.where((o) => !o.isCompleted).toList());
  }

  @override
  Future<void> markCompleted(String orderId) async {
    final idx = _orders.indexWhere((o) => o.orderId == orderId);
    if (idx != -1) {
      _orders[idx].markCompleted();
    }
    await Future.delayed(const Duration(milliseconds: 50));
  }
}