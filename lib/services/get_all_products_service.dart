
import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/product_model.dart';

class AllProductService {
  final Dio dio = Dio(); 

  Future<List<ProductModel>> getAllProduct() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');
      List<dynamic> data = response.data;

      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }
      return productList;
    } catch (e) {
      throw Exception("Failed to load products: $e");
    }
  }
}
