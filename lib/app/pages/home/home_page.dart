import 'package:app_delivery/app/core/ui/base_state/base_state.dart';
import 'package:app_delivery/app/core/ui/helpers/loader.dart';
import 'package:app_delivery/app/core/ui/helpers/messages.dart';
import 'package:app_delivery/app/core/ui/widgets/delivery_app.dart';
import 'package:app_delivery/app/models/product_model.dart';
import 'package:app_delivery/app/pages/home/home_controller.dart';
import 'package:app_delivery/app/pages/home/home_state.dart';
import 'package:app_delivery/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:app_delivery/app/pages/home/widgets/shopping_bag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          //showLoader();
          showInfo('Teste');
          await Future.delayed(Duration(seconds: 2));
          showSucess('Sucesso');
          await Future.delayed(Duration(seconds: 2));
          showError('Erro');
          //hideLoader();
        }),
      ),*/
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loading: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    final orders = state.shoppingBag
                        .where((order) => order.product == product);
                    return DeliveryProductTile(
                      product: product,
                      orderProduct: orders.isNotEmpty ? orders.first : null,
                    );
                  },
                ),
              ),
              Visibility(
                visible: state.shoppingBag.isNotEmpty,
                child: ShoppingBagWidget(bag: state.shoppingBag),
              ),
            ],
          );
        },
      ),
    );
  }
}
