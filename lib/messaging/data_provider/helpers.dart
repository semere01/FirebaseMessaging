import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';

String getMessagesId(String uid) {
  String myUsername = FirebaseAuth.instance.currentUser!.email!
      .substring(0, FirebaseAuth.instance.currentUser!.email!.indexOf("@"));
  String messagesId;
  if (myUsername.compareTo(uid) < 0) {
    messagesId = sha256.convert(utf8.encode('${myUsername}_$uid')).toString();
  } else {
    messagesId = sha256.convert(utf8.encode('${uid}_$myUsername')).toString();
  }
  return messagesId;
}
