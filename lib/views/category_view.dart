import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/get_category_service.dart';
import 'package:ecommerce_app/widgets/best_selling_item.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  final String categoryName;
  const CategoryView({super.key, required this.categoryName});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  void _goBack() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: _goBack,
          ),
          title: Text(
            widget.categoryName,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: GetCategoryService()
                .GetCategory(categoryName: widget.categoryName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> productsList = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.66,
                  ),
                  itemCount: productsList.length,
                  itemBuilder: (context, index) => BestSellingItem(
                    products: productsList[index],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
