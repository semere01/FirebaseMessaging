import 'package:flutter/material.dart';

class StandardInput extends StatelessWidget {
  // const UsernameInput(String mainText, {Key? key}) : super(key: key);

  final bool obscureText;
  final TextEditingController controller;
  const StandardInput(
      {Key? key, required this.controller, this.obscureText = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(border: OutlineInputBorder()),
      obscureText: obscureText,
      controller: controller,
    );
  }
}
