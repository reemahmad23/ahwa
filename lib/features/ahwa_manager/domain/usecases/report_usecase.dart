import 'package:smart_ahwa_manager/features/ahwa_manager/domain/repo/order_repo.dart';

class GetTopSellingDrinksUseCase {
  final OrderRepository repository;

  GetTopSellingDrinksUseCase(this.repository);

  Future<List<MapEntry<String, int>>> call({int topN = 3}) async {
    final all = await repository.getAllOrders();
    final counts = <String, int>{};
    for (var o in all) {
      counts[o.drink.id] = (counts[o.drink.id] ?? 0) + 1;
    }
    final entries = counts.entries.toList();
    entries.sort((a, b) => b.value.compareTo(a.value));
    return entries.take(topN).toList();
  }
}

class GetTotalOrdersServedUseCase {
  final OrderRepository repository;

  GetTotalOrdersServedUseCase(this.repository);

  Future<int> call() async {
    final all = await repository.getAllOrders();
    return all.length;
  }
}
