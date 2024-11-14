import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/add_to_cart_button_and_price.dart';
import 'package:ecommerce_app/widgets/color_option.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:ecommerce_app/widgets/quantity_widget.dart';
import 'package:flutter/material.dart';

class ProductViewBody extends StatelessWidget {
  ProductViewBody({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
          
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Image.network(
            product.image,
            height: 200,
            width: 200,
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        CustomText(text: product.title),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Row(
              children: List.generate(
                5,
                (index) =>  Padding(
                  padding:const  EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.favorite,
                   color: index < product.rating!.rate ? primaryColor : Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const QuantityWidget(),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding:const  EdgeInsets.only(
            left: 8,
          ),
          child: Text(
            maxLines: 3,
            product.description,
            style:const TextStyle(color: primaryColor, fontSize: 14),
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Color: ',
              style: TextStyle(
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            ColorOption(color: Colors.red),
            ColorOption(color: Colors.green),
            ColorOption(color: Colors.blue),
            ColorOption(color: primaryColor),
            ColorOption(color: Colors.black),
          ],
        ),
        const Spacer(),
        AddToCartButtonAndPrice(
          product: product,
        ),
      ],
    );
  }
}
