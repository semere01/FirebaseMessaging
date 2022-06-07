import 'package:flutter/material.dart';

class StandardText extends StatelessWidget {
  final String mainText;
  StandardText(this.mainText, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(mainText);
  }
}
