
import 'package:dio/dio.dart';

class GetAllCategoriesService {
  final Dio dio = Dio(); 

  Future<List<dynamic>> GetAllCategories() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products/categories');
      return response.data;
    } catch (e) {
      throw Exception("Failed to load categories: $e");
    }
  }
}
