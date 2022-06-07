import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class MessagesListPage extends StatefulWidget {
  // Iterable? messages = ["message1", "message2"];
  Iterable? messages;

  MessagesListPage({Key? key, this.messages}) : super(key: key);

  @override
  State<MessagesListPage> createState() => _MessagesListPageState();
}

class _MessagesListPageState extends State<MessagesListPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.messages == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, title: Text("Messages")),
        body: ListView.builder(
          itemBuilder: ((context, index) => Container(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.messages!.toList()[index].toString()),
                ),
              )),
          itemCount: widget.messages!.toList().length,
        ),
      );
    }
  }
}
