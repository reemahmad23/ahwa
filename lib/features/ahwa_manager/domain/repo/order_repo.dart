import 'package:smart_ahwa_manager/features/ahwa_manager/domain/models/order_model.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> getAllOrders();
  Future<void> addOrder(OrderModel order);
  Future<void> markCompleted(String orderId);
  Future<List<OrderModel>> getPendingOrders();
}