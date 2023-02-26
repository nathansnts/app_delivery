import 'package:app_delivery/app/core/config/env/env.dart';
import 'package:app_delivery/delivery_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await Env.i.load();
  print(Env.i['backend_base_url'] ?? 'Not found');
  runApp(DeliveryApp());
}
