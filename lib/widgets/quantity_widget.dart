import 'package:ecommerce_app/const.dart';
import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline, color: Colors.grey),
          onPressed: () {},
        ),
        const Text(
          '01',
          style: TextStyle(fontSize: 16, color: primaryColor),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline, color: primaryColor),
          onPressed: () {},
        ),
      ],
    );
  }
}
