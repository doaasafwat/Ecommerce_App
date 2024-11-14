import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartButtonAndPrice extends StatelessWidget {
  AddToCartButtonAndPrice({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, CartProvider, child) {
      return Container(
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            shape: BoxShape.rectangle),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Text(
              r'$' '${product.price.toString()}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                CartProvider.toggleCart(product);
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      );
    });
  }
}
