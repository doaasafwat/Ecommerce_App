import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/provider/favorites_provider.dart';
import 'package:ecommerce_app/widgets/best_selling_item.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          if (favoritesProvider.favorites.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/no-favorites.png',
                height: 100,
              ),
            );
          }
          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.66,
                  ),
                  itemCount: favoritesProvider.favorites.length,
                  itemBuilder: (context, index) {
                    final product = favoritesProvider.favorites[index];
                    return BestSellingItem(products: product);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
