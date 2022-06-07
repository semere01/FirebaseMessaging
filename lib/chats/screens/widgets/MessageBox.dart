import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

abstract class MessageBox extends StatelessWidget {
  String message;
  Color? backgroundColor = Colors.white;
  Color? foregroundColor = Colors.black;
  MainAxisAlignment alignment;
  MessageBox(
      {Key? key,
      this.backgroundColor,
      this.foregroundColor,
      required this.message,
      required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: backgroundColor,
              border: Border.all(color: Colors.blue),
            ),
            child: Text(
              message,
              style: TextStyle(color: foregroundColor),
            )),
      ],
    );
  }
}
