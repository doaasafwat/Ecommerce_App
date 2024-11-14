import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/widgets/quantity_widget.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.image,
                  width: 70,
                  height: 90,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.title.substring(0, 10),
                          style: const TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeFromCart(product);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: const TextStyle(
                              fontSize: 15,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const QuantityWidget(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
