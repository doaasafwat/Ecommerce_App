import 'package:ecommerce_app/const.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed,  this.isLoading=false});
  final String text;
  final void Function() onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
          ),
          onPressed: onPressed,
          child:isLoading?const CircularProgressIndicator() :Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )),
    );
  }
}
