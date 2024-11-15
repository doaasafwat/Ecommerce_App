import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/get_all_products_service.dart';
import 'package:ecommerce_app/widgets/best_selling_item.dart';
import 'package:flutter/material.dart';

class GridViewBestSelling extends StatelessWidget {
  const GridViewBestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: AllProductService().getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> productsList = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.66,
            ),
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              return BestSellingItem(products: productsList[index]);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
