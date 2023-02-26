import 'package:app_delivery/app/core/rest_client/custom_dio.dart';
import 'package:app_delivery/app/pages/home/home_controller.dart';
import 'package:app_delivery/app/pages/home/home_page.dart';
import 'package:app_delivery/app/products/products_repository.dart';
import 'package:app_delivery/app/products/products_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductRepository>(
            create: (context) => ProductsRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => HomeController(context.read()),
          ),
        ],
        child: const HomePage(),
      );
}
