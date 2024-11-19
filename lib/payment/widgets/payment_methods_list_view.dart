import 'package:ecommerce_app/payment/widgets/payment_methods_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, required this.updatePaymentMethod});
final Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  @override
  final List<String> paymentMethodsItem = const [
    'assets/card.svg',
    'assets/paypal.svg',
  ];
  int activeIndex = 0;
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
          itemCount: paymentMethodsItem.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
                 widget.updatePaymentMethod(index: activeIndex);
              },
              child: PaymentMethodItem(
                  isActive: activeIndex == index,
                  image: paymentMethodsItem[index]),
            );
          }),
    );
  }
}
