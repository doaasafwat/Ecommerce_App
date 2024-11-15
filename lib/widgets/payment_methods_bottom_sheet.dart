import 'package:ecommerce_app/payment/widgets/payment_methods_list_view.dart';
import 'package:ecommerce_app/widgets/custom_button_bloc_consumer.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           SizedBox(
            height: 16,
          ),
           PaymentMethodsListView(),
           SizedBox(
            height: 32,
          ),
          CustomButtonBlocCunsumer(),
        ],
      ),
    );
  }
}