import 'package:dio/dio.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/product_model.dart';

class GetCategoryService {
  final Dio dio = Dio();

  Future<List<ProductModel>> GetCategory({required String categoryName}) async {
    try {
      Response response = await dio.get('$apiCategoey$categoryName');
      List<dynamic> data = response.data;

      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }
      return productList;
    } catch (e) {
      throw Exception("Failed to load category: $e");
    }
  }
}
