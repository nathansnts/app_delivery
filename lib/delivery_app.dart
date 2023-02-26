import 'package:app_delivery/app/core/global/global_context.dart';
import 'package:app_delivery/app/core/provider/application_binding.dart';
import 'package:app_delivery/app/core/ui/theme/theme_config.dart';
import 'package:app_delivery/app/pages/auth/login/login_router.dart';
import 'package:app_delivery/app/pages/home/home_page.dart';
import 'package:app_delivery/app/pages/home/home_router.dart';
import 'package:app_delivery/app/pages/auth/login/login_page.dart';
import 'package:app_delivery/app/pages/order/order_completed_page.dart';
import 'package:app_delivery/app/pages/order/order_page.dart';
import 'package:app_delivery/app/pages/order/order_router.dart';
import 'package:app_delivery/app/pages/product_detail/product_detail_routers.dart';
import 'package:app_delivery/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'app/pages/auth/register/register_page.dart';
import 'app/pages/auth/register/register_router.dart';

class DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  DeliveryApp({super.key}) {
    GlobalContext.i.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Vakinha Burguer',
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouters.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
          '/order/completed': (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}
