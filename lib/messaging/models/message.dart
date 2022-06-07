import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:messaging_bloc/main.dart';

@immutable
class Message extends Equatable {
  Message({
    required this.from,
    required this.content,
    required this.date,
  });

  String from;
  String content;
  DateTime date;

  @override
  List<Object> get props => [from, content, date];

  factory Message.fromJson(Map<String, dynamic> json) {
    var message = Message(
      from: json['from'],
      content: json['content'],
      date: json['date'].toDate(),
    );
    return message;
  }

  Map<String, dynamic> toJson() {
    return {'from': from, 'content': content, 'date': date};
  }

  // static List<Message> toMessageList({
  //   List<QueryDocumentSnapshot<Map<String, dynamic>>> list1 = const [],
  //   List<QueryDocumentSnapshot<Map<String, dynamic>>> list2 = const [],
  // }) {
  // print("list1 - $list1");
  // List<Message> messageList = [];
  // List<QueryDocumentSnapshot<Map<String, dynamic>>> finalList = [];
  // while (list1.isNotEmpty && list2.isNotEmpty) {
  //   if (list1[0].data()["date"] > list2[0].data()["date"]) {
  //     finalList.add(list1.removeAt(0));
  //   } else {
  //     finalList.add(list2.removeAt(0));
  //   }
  // }
  // if (list1.isNotEmpty) {
  //   finalList += list1;
  // }
  // if (list2.isNotEmpty) {
  //   finalList += list1;
  // }
  // print("finallist: $finalList");

  static List<Message> toMessageList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> finalList) {
    List<Message> messageList = [];
    for (var x in finalList) {
      var jsonForm = Message.fromJson(x.data());
      messageList.add(jsonForm);
    }
    return messageList;
  }

  @override
  String toString() =>
      'Message { foreignUserId: $from, content: $content, time: $date }';
}
