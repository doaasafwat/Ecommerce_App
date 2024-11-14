import 'package:ecommerce_app/views/product_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/get_all_products_service.dart';
import 'package:ecommerce_app/widgets/categories_list_view.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:ecommerce_app/widgets/custom_text_field.dart';
import 'package:ecommerce_app/widgets/grid_view_best_selling.dart';
import 'package:ecommerce_app/provider/favorites_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProductModel> productList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      productList = await AllProductService().getAllProduct();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching products: $e")),
      );
    }
  }

  void performSearch(String query) {
    if (query.isEmpty || query.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter at least 4 characters")),
      );
      return;
    }

    final results = productList
        .where((product) => product.title
            .toLowerCase()
            .startsWith(query.toLowerCase().substring(0, 4)))
        .toList();

    if (results.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductView(product: results[0]),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No products found")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffEDECF2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            CustomSearchTextField(
              onSearch: performSearch,
            ),
            const CustomText(
              text: 'Categories',
            ),
            const SizedBox(height: 80, child: CategoriesListView()),
            const CustomText(
              text: 'Best Selling',
            ),
            // نستخدم Consumer هنا لضمان تحديث الحالة
            Consumer<FavoritesProvider>(
              builder: (context, favoritesProvider, child) {
                return SizedBox(height: 400, child: GridViewBestSelling());
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
