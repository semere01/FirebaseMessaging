import 'package:equatable/equatable.dart';

import '../course.dart';

class MessagesState extends Equatable {
  MessagesState();

  @override
  List<Object> get props => [(this).toString()];
}

class MessagesLoading extends MessagesState {}

class MessagesFailed extends MessagesState {
  String errorMessage;
  MessagesFailed(this.errorMessage);
}

class MessagesLoaded extends MessagesState {
  List<Message> messages;
  String foreignUserId;
  MessagesLoaded(this.foreignUserId, this.messages);
}

class MessagesInitial extends MessagesState {}
