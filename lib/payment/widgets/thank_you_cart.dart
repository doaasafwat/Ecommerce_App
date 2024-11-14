import 'package:ecommerce_app/payment/widgets/card_info_widget.dart';
import 'package:ecommerce_app/payment/widgets/payment_item_info.dart';
import 'package:ecommerce_app/payment/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCart extends StatelessWidget {
  const ThankYouCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color(0xffEDEDED),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 22,
          right: 22,
        ),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Your transaction was successful',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 42,
            ),
            const PaymentItemInfo(text: 'Date', date: '01/24/2023'),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(text: 'Time', date: '10:15 AM'),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(text: 'To', date: 'Sam Louis'),
            const Divider(
              height: 40,
              color: Color(0xffEDEDED),
              thickness: 1.3,
            ),
            const TotalPrice(title: 'Total', value: '50.97'),
            const SizedBox(
              height: 20,
            ),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text('PAID',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff34A853),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .15 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
