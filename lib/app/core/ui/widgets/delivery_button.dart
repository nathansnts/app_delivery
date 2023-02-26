import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.heigth,
      this.width = 50});

  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? heigth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
