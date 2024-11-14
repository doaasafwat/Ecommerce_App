import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/payment_methods_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      height: 140,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Total:',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                r'$' '${cartProvider.totalPrice.toString()}',
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: CustomButton(
                  text: 'Complete Payment',
                  onPressed: () {
                
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const PaymentMethodsBottomSheet();
                        });
                  },
                ),
              )),
        ],
      ),
    );
  }
}
