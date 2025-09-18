import 'package:smart_ahwa_manager/features/ahwa_manager/domain/models/drink_model.dart';

class OrderModel {
  final String _orderId;
  final String _customerName;
  final DrinkModel _drink;
  final String _instructions;
  bool _isCompleted;

  OrderModel({
    required String orderId,
    required String customerName,
    required DrinkModel drink,
    String instructions = '',
    bool isCompleted = false,
  })  : _orderId = orderId,
        _customerName = customerName,
        _drink = drink,
        _instructions = instructions,
        _isCompleted = isCompleted;


  String get orderId => _orderId;
  String get customerName => _customerName;
  DrinkModel get drink => _drink;
  String get instructions => _instructions;
  bool get isCompleted => _isCompleted;    

   void markCompleted() {
    _isCompleted = true;
  }   
}

