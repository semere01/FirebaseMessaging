import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border.symmetric(color: Colors.blue),
            // ),
            child: TextField(),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
          ),
        ),
      ],
    );
  }
}
