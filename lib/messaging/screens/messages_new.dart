import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';



class MessagesNewPage extends StatefulWidget {

  MessagesNewPage({Key? key})
      : super(key: key);

  @override
  State<MessagesNewPage> createState() => _MessagesNewPageState();
}

class _MessagesNewPageState extends State<MessagesNewPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: TextField(),
        ),
        body: _messagingBody(),
      );
  }
  _messagingBody() {
      return Center(child: Text("No Messages"));
  }

}
