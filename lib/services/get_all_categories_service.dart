
import 'package:dio/dio.dart';
import 'package:ecommerce_app/const.dart';

class GetAllCategoriesService {
  final Dio dio = Dio(); 

  Future<List<dynamic>> GetAllCategories() async {
    try {
      Response response = await dio.get(apiAllCategories);
      return response.data;
    } catch (e) {
      throw Exception("Failed to load categories: $e");
    }
  }
}
