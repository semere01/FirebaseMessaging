import 'package:equatable/equatable.dart';

import '../chats.dart';

abstract class ChatsEvent extends Equatable {
  const ChatsEvent();
}

class AddUserEvent extends ChatsEvent {
  String foreignUserId;
  AddUserEvent(this.foreignUserId);

  @override
  List<Object?> get props => [foreignUserId];
}

class ChatsPageLoadedEvent extends ChatsEvent {
  ChatsPageLoadedEvent();

  @override
  List<Object?> get props => [];
}
