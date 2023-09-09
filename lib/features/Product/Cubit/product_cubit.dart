import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_project_sat26/features/Product/Models/ProductModel.dart';
import 'package:new_project_sat26/features/Product/data/Product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
void getProduct(int id)async{

  final Product =await ProductRepo().getProductRepo(id);

emit(ProductSuccessful(Product!));

  }

}



