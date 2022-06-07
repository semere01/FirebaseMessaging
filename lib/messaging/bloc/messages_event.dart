import 'package:equatable/equatable.dart';

import '../course.dart';

abstract class MessagesEvent extends Equatable {
  const MessagesEvent();
}

class OpenUserMessagesEvent extends MessagesEvent {
  String foreignUserId;
  OpenUserMessagesEvent(this.foreignUserId);

  @override
  List<Object?> get props => [foreignUserId];
}

class SendMessageEvent extends MessagesEvent {
  String foreignUserId;
  String content;
  SendMessageEvent(this.foreignUserId, this.content);

  @override
  List<Object?> get props => [];
}
