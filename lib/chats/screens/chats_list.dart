import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messaging_bloc/chats/bloc/bloc.dart';
import 'package:messaging_bloc/routes/router.gr.dart';
import 'package:provider/provider.dart';

class ChatsListPage extends StatefulWidget {
  ChatsListPage({Key? key}) : super(key: key);

  @override
  State<ChatsListPage> createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        if (state is ChatsInitial) {
          context.read<ChatsBloc>().add(ChatsPageLoadedEvent());
        }
        if (state is UserAdded) {
          context.router
              .push(MessagesMainRoute(messengerId: state.foreignUser));
        }
        return Scaffold(
          appBar: _buildAppBar(state),
          body: _buildBody(state),
          floatingActionButton: _buildFloatingActionButton(state),
        );
      },
    );
  }

  _buildAppBar(ChatsState state) {
    String? text = "Loading";
    if (state is ChatsLoaded) {
      String email = FirebaseAuth.instance.currentUser!.email!;
      text = email.substring(0, email.indexOf("@"));
    }
    return AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      context.router.replaceAll([SignInRoute()]);
                    },
                    child: Text("Logout")),
              ],
            ),
          ],
        ));
  }

  _buildBody(ChatsState state) {
    if (state is ChatsFailed) {
      return Center(
        child:
            Text("Error Occured while fetching chats: ${state.errorMessage}"),
      );
    } else if ((state is ChatsLoaded && state.chats.toList().isEmpty)) {
      return Center(
        child: Text("No chats"),
      );
    } else if (state is ChatsLoaded) {
      return ListView.builder(
        itemBuilder: ((context, index) => _listEntry(index, state)),
        itemCount: state.chats.toList().length,
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _listEntry(int index, ChatsLoaded state) {
    if (state.chats.toList()[index].toString() == "") {
      return Container();
    }
    return GestureDetector(
      onTap: () {
        context.router.push(MessagesMainRoute(
            messengerId: state.chats.toList()[index].toString()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Color.fromARGB(255, 90, 88, 88)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(state.chats.toList()[index].toString()),
        ),
      ),
    );
  }

  TextEditingController controller = TextEditingController();

  _showDialog() {
    showDialog<void>(
      barrierColor: Color.fromARGB(150, 200, 200, 200),
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: ' Enter username',
            ),
          ),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          actionsOverflowButtonSpacing: 20,
          actions: [
            // ElevatedButton(onPressed: () {}, child: Text("Back")),
            ElevatedButton(
                onPressed: () {
                  context.read<ChatsBloc>().add(AddUserEvent(controller.text));
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
                child: Text("Message")),
          ],
        );
      },
      context: context,
    );
  }




  Widget? _buildFloatingActionButton(state) {
    if (state is ChatsLoaded) {
      return FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: Icon(Icons.abc),
      );
    }
    return null;
  }
}
