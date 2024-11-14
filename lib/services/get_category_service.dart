import 'package:ecommerce_app/helper/api.dart';
import 'package:ecommerce_app/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> GetCategory({required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
