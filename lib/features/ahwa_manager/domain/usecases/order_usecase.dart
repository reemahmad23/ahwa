import 'package:smart_ahwa_manager/features/ahwa_manager/domain/models/order_model.dart';
import 'package:smart_ahwa_manager/features/ahwa_manager/domain/repo/order_repo.dart';


class AddOrderUseCase {
  final OrderRepository repo;
  AddOrderUseCase(this.repo);
  Future<void> call(OrderModel o) => repo.addOrder(o);
}

class GetPendingOrdersUseCase {
  final OrderRepository repo;
  GetPendingOrdersUseCase(this.repo);
  Future<List<OrderModel>> call() => repo.getPendingOrders();
}

class CompleteOrderUseCase {
  final OrderRepository repository;
  CompleteOrderUseCase(this.repository);

  Future<void> call(String orderId) => repository.markCompleted(orderId);
}
