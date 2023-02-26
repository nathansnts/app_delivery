import 'package:app_delivery/app/dto/order_product_dto.dart';
import 'package:app_delivery/app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState(
      {required this.status,
      required this.products,
      this.errorMessage,
      required this.shoppingBag});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppingBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    List<OrderProductDto>? shoppingBag,
    String? errorMessage,
  }) {
    return HomeState(
        status: status ?? this.status,
        products: products ?? this.products,
        shoppingBag: shoppingBag ?? this.shoppingBag,
        errorMessage: errorMessage);
  }
}
