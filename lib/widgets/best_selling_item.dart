import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/provider/favorites_provider.dart';
import 'package:ecommerce_app/views/product_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BestSellingItem extends StatelessWidget {
  const BestSellingItem({super.key, required this.products});
  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Consumer2<FavoritesProvider, CartProvider>(
      builder: (context, favoritesProvider, CartProvider, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductView(product: products),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        favoritesProvider.toggleFavorite(products);
                      },
                      icon: Icon(
                        favoritesProvider.isFavorite(products)
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.network(
                      products.image,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.title.substring(0, 11),
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      r'$' + products.price.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        CartProvider.isCart(products)
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        color: CartProvider.isCart(products)
                            ? primaryColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        CartProvider.toggleCart(products);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
