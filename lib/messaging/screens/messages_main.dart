import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messaging_bloc/messaging/bloc/bloc.dart';
import 'package:messaging_bloc/messaging/bloc/messages_bloc.dart';
import 'package:messaging_bloc/messaging/screens/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../bloc/messages_state.dart';

class MessagesMainPage extends StatefulWidget {
  // Iterable? messages = ["message1", "message2"];
  String messengerId;

  MessagesMainPage({Key? key, required this.messengerId}) : super(key: key);

  @override
  State<MessagesMainPage> createState() => _MessagesMainPageState();
}

class _MessagesMainPageState extends State<MessagesMainPage> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
    context.read<MessagesBloc>().add(OpenUserMessagesEvent(widget.messengerId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        // if (state is MessagesInitial) {
        //   BlocProvider.of<MessagesBloc>(context)
        //       .add(OpenUserMessagesEvent(widget.messengerId));
        // }
        return Scaffold(
          appBar: _appBar(state),
          body: _messagingBody(state),
        );
      },
    );
  }

  _appBar(MessagesState state) {
    String header = "header";
    if (state is MessagesLoading) header = "Loading...";
    // if (state is MessagesLoaded) header = FirebaseAuth.instance.currentUser!.email!;
    if (state is MessagesLoaded) header = widget.messengerId;

    return AppBar(
      title: Text(header),
    );
  }

  _getMessagesBoxes(MessagesLoaded state) {
    List<Widget> messageBoxes = [];
    for (var message in state.messages) {
      String email = FirebaseAuth.instance.currentUser!.email!;
      String username = email.substring(0, email.indexOf("@"));
      if (message.from != username) {
        messageBoxes.add(ForeignMessageBox(message: message.content));
      } else {
        messageBoxes.add(LocalMessageBox(message: message.content));
      }
    }
    return messageBoxes;
  }

  _messagingBody(MessagesState state) {
    if (state is MessagesLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MessagesLoaded) {
      List<Widget> widgetList = _getMessagesBoxes(state) + [_buildMessageInput(state)];
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: widgetList,
        // children: [
        //   LocalMessageBox(message: state.messages[0].toString()),
        //   ForeignMessageBox(message: state.messages[1].toString()),
        //   const Divider(
        //     height: 0.1,
        //     thickness: .3,
        //     color: Colors.blue,
        //   ),
        //   MessageInput()
        // ],
      );
      return Center(child: Text("No Messages"));
    }
  }

  Widget _buildMessageInput(MessagesLoaded state) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border.symmetric(color: Colors.blue),
            // ),
            child: TextField(
              controller: controller,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {
              if (controller.text != "") {
                context.read<MessagesBloc>().add(
                    SendMessageEvent(state.foreignUserId, controller.text));
              }
            },
            icon: const Icon(Icons.send),
          ),
        ),
      ],
    );
  }
}
