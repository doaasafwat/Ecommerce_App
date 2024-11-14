import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/widgets/check_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/item_cart.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<CartProvider>(builder: (context, CartProvider, child) {
        if (CartProvider.cartList.isEmpty) {
          return Center(
            child: Image.asset(
              'assets/empty_cart.jpg',
              height: 250,
            ),
          );
        }
        return Column(children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                  itemCount: CartProvider.cartList.length,
                  itemBuilder: (context, index) {
                    final product = CartProvider.cartList[index];
                    return ItemCart(
                      product: product,
                    );
                  }),
            ),
          ),
          const CheckOutWidget(),
        ],);
      }),
    );
  }
}


