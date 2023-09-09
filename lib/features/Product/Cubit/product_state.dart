part of 'product_cubit.dart';



abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSuccessful extends ProductState {
  final ProductModel Product;

  ProductSuccessful(this.Product);


}

class ProductFailed extends ProductState {}

class ProductNoInternetConnectionFailed extends ProductState {}

class LoadingProduct extends ProductState {}
