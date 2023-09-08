import 'package:dio/dio.dart';

class ProductRepo{
  
  Future<Response> getProductById(int id)async{
    final response=await Dio().get("https://student.valuxapps.com/api/products/${id}");
 return response.data;
  }
  
  
  
}