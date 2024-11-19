import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    this.isObsecure = false,
    this.isReadOnly = false,
    this.onTap,
    this.isPasswordVisible = false,
    this.onTogglePasswordVisibility,
  });

  final bool isReadOnly;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePasswordVisibility;
  final String hintText;
  final TextEditingController? controller;
  final bool isObsecure;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      obscureText: isPassword && !isPasswordVisible,
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
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onTogglePasswordVisibility,
                icon: Icon(
                  isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
      style: const TextStyle(color: Colors.black),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
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
