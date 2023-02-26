import 'package:app_delivery/app/core/ui/helpers/size.extensions.dart';
import 'package:app_delivery/app/core/ui/styles/text_styles.dart';
import 'package:app_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.percentHeight(.2),
              ),
              Image.asset('assets/images/logo_rounded.png'),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Pedido realizado com sucesso, aguarde até a sua entrega ser realizada!',
                textAlign: TextAlign.center,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DeliveryButton(
                  label: 'FECHAR',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  heigth: 50,
                  width: context.percentWith(.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
