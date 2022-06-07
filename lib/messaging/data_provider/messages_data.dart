import 'dart:convert';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messaging_bloc/messaging/data_provider/helpers.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../course.dart';

class MessagesDataProvider {
  Future<List<Message>> getMessagesFromUser(String foreignUserId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String messagesId = getMessagesId(foreignUserId);
    var messages = await db.collection(messagesId).orderBy("date").limitToLast(1).get();
    return Message.toMessageList(messages.docs);
  }

  Future<void> sendMessageToUser(String foreignUserId, String content) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String email = FirebaseAuth.instance.currentUser!.email!;
    String username = email.substring(0, email.indexOf("@"));
    await db
        .collection(getMessagesId(foreignUserId))
        .add({"from": username, "content": content, "date": DateTime.now()});
  }

  
}
