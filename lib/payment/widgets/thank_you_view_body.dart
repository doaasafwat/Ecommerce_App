import 'package:ecommerce_app/payment/widgets/custom_circle_avatar.dart';
import 'package:ecommerce_app/payment/widgets/custom_dashed_line.dart';
import 'package:ecommerce_app/payment/widgets/thank_you_cart.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCart(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.15 + 20,
            left: 24,
            right: 24,
            child: const CustomDashedLine(),
          ),
          const CustomCircleAvatar(
            positioned: 'left',
          ),
          const CustomCircleAvatar(
            positioned: 'right',
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: -30,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffEDEDED),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff34A853),
                child: Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
