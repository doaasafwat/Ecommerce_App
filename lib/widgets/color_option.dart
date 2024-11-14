import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  final Color color;

  const ColorOption({required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade100,
            width: 1,
          ),
        ),
      ),
    );
  }
}
