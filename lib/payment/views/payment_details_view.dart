import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/payment/widgets/payment_details_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          leading: const BackButton(),
          title: const Text(
            'Payment Details',
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),),
          body: const  PaymentDetailsBody(),
    );
  }
}