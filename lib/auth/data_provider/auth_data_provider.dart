import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../auth.dart';

class AuthDataProvider {
  createUser(String username, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: '$username@protonmail.com', password: password);

      await FirebaseFirestore.instance
          .collection("chats")
          .doc(username)
          .set({"chat_list": []});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> authenticateUser(username, password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$username@protonmail.com', password: password);
  }
}
