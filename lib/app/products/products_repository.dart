import 'package:app_delivery/app/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAllProducts();
}
