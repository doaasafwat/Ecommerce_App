import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCurvedNavigationBar extends StatelessWidget {
  final void Function(int) ontap;
  final int index;

  const CustomCurvedNavigationBar({
    super.key,
    required this.ontap,
    this.index = 1,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      // backgroundColor: const Color(0xffEDECF2),
      backgroundColor: Colors.white,
      color: primaryColor,
      items: const <Widget>[
        Icon(
          CupertinoIcons.cart_fill,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          CupertinoIcons.heart_fill,
          size: 30,
          color: Colors.white,
        ),
      ],
      index: index,
      onTap: ontap,
    );
  }
}
