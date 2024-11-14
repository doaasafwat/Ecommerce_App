import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/provider/favorites_provider.dart';
import 'package:ecommerce_app/widgets/product_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
        builder: (context, FavoritesProvider, child) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text(
            'Product',
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              iconSize: 30,
              icon: Icon( FavoritesProvider.isFavorite(product)
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,),
              color: Colors.red,
              onPressed: () {
                FavoritesProvider.toggleFavorite(product);
              },
            ),
          ],
        ),
        body: ProductViewBody(
          product: product,
        ),
      );
    });
  }
}
