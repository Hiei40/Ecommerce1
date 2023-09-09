part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSuccessful extends ProductState {
  final ProductModel Product;

  ProductSuccessful(this.Product);


}

class ProductFailed extends ProductState {}

class ProductNoInternetConnectionFailed extends ProductState {}

class ProductLoading extends ProductState {}
