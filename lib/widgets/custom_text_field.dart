import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key, required this.onSearch});

  final textController = TextEditingController();
  final textKey = GlobalKey<FormState>();
  final Function(String) onSearch;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: textKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: TextFormField(
          controller: textController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
            suffixIcon: IconButton(
              onPressed: () {
                if (textKey.currentState!.validate()) {
                  onSearch(textController.text);
                }
              },
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 25,
              ),
            ),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
