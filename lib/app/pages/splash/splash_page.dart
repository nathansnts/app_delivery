// ignore: implementation_imports
import 'package:app_delivery/app/core/ui/helpers/size.extensions.dart';
import 'package:app_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vakinha Delivery'),
      ),
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.35),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                    label: 'Acessar',
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                    width: context.percentWith(.6),
                    heigth: 35,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
