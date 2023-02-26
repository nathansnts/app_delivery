import 'package:app_delivery/app/pages/product_detail/product_detail_controller.dart';
import 'package:app_delivery/app/pages/product_detail/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailRouters {
  ProductDetailRouters._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => ProductDetailController()),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;

          return ProductDetailPage(
            product: args['product'],
            order: args['order'],
          );
        },
      );
}
