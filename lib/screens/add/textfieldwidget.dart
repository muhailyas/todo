import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.maximumLine = 1,
      required this.hintText,
      required this.controller,
      this.height = 70});
  final int maximumLine;
  final String hintText;
  final double height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 45, 197, 172),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "please fill the $hintText".toLowerCase();
            }
            return null;
          },
          maxLines: maximumLine,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: hintText,
              labelStyle: const TextStyle(color: Colors.white),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
