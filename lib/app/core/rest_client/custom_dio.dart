import 'package:app_delivery/app/core/config/env/env.dart';
import 'package:app_delivery/app/core/rest_client/interceptors/auth_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  late AuthInterceptors _authInterceptors;

  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? 'Not found',
            connectTimeout: 5000,
            receiveTimeout: 60000,
          ),
        ) {
    interceptors.add(
      LogInterceptor(
          requestBody: true, responseBody: true, requestHeader: true),
    );

    _authInterceptors = AuthInterceptors();
  }

  CustomDio auth() {
    interceptors.add(_authInterceptors);
    return this;
  }

  CustomDio anauth() {
    interceptors.remove(_authInterceptors);
    return this;
  }
}
