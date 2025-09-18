import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/features/ahwa_manager/domain/models/order_model.dart';
import 'package:smart_ahwa_manager/features/ahwa_manager/domain/usecases/order_usecase.dart';

class OrderManager extends ChangeNotifier {
  final GetPendingOrdersUseCase _getPending;
  final AddOrderUseCase _addOrder;
  final CompleteOrderUseCase _complete;

  List<OrderManager> _pending = [];
  UnmodifiableListView<OrderModel> get pending => UnmodifiableListView(_pending as Iterable<OrderModel>);

  OrderManager({
    required GetPendingOrdersUseCase getPending,
    required AddOrderUseCase addOrder,
    required CompleteOrderUseCase complete,
  })  : _getPending = getPending,
        _addOrder = addOrder,
        _complete = complete;

  Future<void> loadPending() async {
    _pending = (await _getPending.call()).cast<OrderManager>();
    notifyListeners();
  }

  Future<void> addOrder(OrderManager o) async {
    await _addOrder.call(o as OrderModel);
    await loadPending();
  }

  Future<void> completeOrder(String id) async {
    await _complete.call(id);
    await loadPending();
  }
}