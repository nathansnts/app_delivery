import 'package:app_delivery/app/core/rest_client/custom_dio.dart';
import 'package:app_delivery/app/repositories/auth/auth_repository.dart';
import 'package:app_delivery/app/repositories/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  const ApplicationBinding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: ((context) => CustomDio()),
        ),
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            dio: context.read(),
          ),
        )
      ],
      child: child,
    );
  }
}
