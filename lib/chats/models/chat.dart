import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Chat extends Equatable {
  Chat(
      {required this.username,
      required this.lastMessageTime,
      required this.lastMessageContent});

  final String username;
  final DateTime lastMessageTime;
  final String lastMessageContent;

  @override
  List<Object> get props => [username, lastMessageTime, lastMessageContent];

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      username: json['username'],
      lastMessageTime: json['lastMessageTime'],
      lastMessageContent: json['lastMessageContent'],
    );
  }

  @override
  String toString() => 'Chat { username: $username, lastMessageContent: $lastMessageContent, lastMessageContent: $lastMessageContent }';
}
