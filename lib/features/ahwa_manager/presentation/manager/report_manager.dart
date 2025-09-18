// lib/features/orders/presentation/state/report_manager.dart
import 'package:flutter/foundation.dart';
import 'package:smart_ahwa_manager/features/ahwa_manager/domain/usecases/report_usecase.dart';

class ReportManager extends ChangeNotifier {
  final GetTopSellingDrinksUseCase getTopSellingDrinksUseCase;
  final GetTotalOrdersServedUseCase getTotalOrdersServedUseCase;

  ReportManager({
    required this.getTopSellingDrinksUseCase,
    required this.getTotalOrdersServedUseCase,
  });

  List<MapEntry<String, int>> _topDrinks = [];
  int _totalOrders = 0;

  List<MapEntry<String, int>> get topDrinks => _topDrinks;
  int get totalOrders => _totalOrders;

  Future<void> loadReports() async {
    _topDrinks = await getTopSellingDrinksUseCase(topN: 3);
    _totalOrders = await getTotalOrdersServedUseCase();
    notifyListeners();
  }
}
