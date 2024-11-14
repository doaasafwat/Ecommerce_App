import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.positioned,
  });
  final String positioned;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: positioned == 'left' ? -20 : null,
      right: positioned == 'right' ? -20 : null,
      bottom: MediaQuery.sizeOf(context).height * 0.15,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
