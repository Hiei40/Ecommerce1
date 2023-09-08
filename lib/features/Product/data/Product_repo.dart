import 'package:dio/dio.dart';
import 'package:new_project_sat26/features/Product/Models/ProductModel.dart';

class ProductRepo {
  Future<ProductModel?> getProductRepo(int id) async {
    try {
      final response = await Dio().get('https://student.valuxapps.com/api/$id');
      return productModelFromJson(response.data["data"]);
    } catch (_) {
      // TODO
      return null;
    }
  }
}
