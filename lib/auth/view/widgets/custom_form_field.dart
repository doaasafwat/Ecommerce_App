import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObsecure = false,
    this.isReadOnly = false,
    this.onTap,
  });

  final bool isReadOnly;
  final String hintText;
  final TextEditingController? controller;
  final bool isObsecure;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: Custom_Border(
            side: const BorderSide(color: Colors.black, width: 0.5), redius: 8),
        focusedBorder: Custom_Border(
            side: const BorderSide(color: Colors.black, width: 1), redius: 8),
        errorBorder: Custom_Border(
          side: const BorderSide(color: Colors.red, width: 1),
          redius: 8,
        ),
        focusedErrorBorder: Custom_Border(
          side: const BorderSide(color: Colors.red, width: 1),
          redius: 8,
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
      obscureText: isObsecure,
    );
  }

  OutlineInputBorder Custom_Border(
      {required BorderSide side, required double redius}) {
    return OutlineInputBorder(
      borderSide: side,
      borderRadius: BorderRadius.circular(redius),
    );
  }
}
