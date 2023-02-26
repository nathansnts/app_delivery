import 'dart:developer';

import 'package:app_delivery/app/core/rest_client/custom_dio.dart';
import 'package:app_delivery/app/products/products_repository.dart';
import 'package:dio/dio.dart';
import '../core/exceptions/repository_exception.dart';
import '../models/product_model.dart';

class ProductsRepositoryImpl implements ProductRepository {
  final CustomDio dio;

  ProductsRepositoryImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.anauth().get('/products');

      return result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}
