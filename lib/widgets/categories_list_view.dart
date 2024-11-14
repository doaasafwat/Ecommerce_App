import 'package:ecommerce_app/services/get_all_categories_service.dart';
import 'package:ecommerce_app/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
      List<String> ImageList = [
    'assets/elec.jpg',
    'assets/jew.jpg',
    'assets/men.jpg',
    'assets/women.jpg',
  ];
    return FutureBuilder(
        future: GetAllCategoriesService().GetAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> categories=snapshot.data!;
            return ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  CategoryItem(categoryList: [categories[index]], ImageList: ImageList[index],);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
