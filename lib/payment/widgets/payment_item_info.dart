import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.text, required this.date});
  final String text, date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
         text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
       const Spacer(),
        Text(
          date,
          style:const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
