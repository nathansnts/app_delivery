import 'package:app_delivery/app/pages/order/order_controller.dart';
import 'package:app_delivery/app/pages/order/order_page.dart';
import 'package:app_delivery/app/pages/product_detail/product_detail_controller.dart';
import 'package:app_delivery/app/pages/product_detail/product_detail_page.dart';
import 'package:app_delivery/app/repositories/order/order_repository.dart';
import 'package:app_delivery/app/repositories/order/order_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<OrderRepository>(
            create: (context) => OrderRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => OrderController(context.read()),
          ),
        ],
        child: const OrderPage(),
      );
}
