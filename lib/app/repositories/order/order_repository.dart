import 'package:app_delivery/app/dto/order_dto.dart';
import 'package:app_delivery/app/models/payment_type_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsTypes();
  Future<void> saveOrder(OrderDto order);
}
